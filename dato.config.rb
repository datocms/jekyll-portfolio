# Read all the details about the commands available in this file here:
# https://github.com/datocms/ruby-datocms-client/blob/master/docs/dato-cli.md

# iterate over all the `social_profile` item types
social_profiles = dato.social_profiles.map do |profile|
  {
    url: profile.url,
    type: profile.profile_type.downcase.gsub(/ +/, '-'),
  }
end

# Create a YAML data file to store global data about the site
create_data_file "src/_data/settings.yml", :yaml,
  name: dato.site.global_seo.site_name,
  language: dato.site.locales.first,
  intro: dato.home.intro_text,
  copyright: dato.home.copyright,
  social_profiles: social_profiles,
  favicon_meta_tags: dato.site.favicon_meta_tags

# Create a markdown file with the SEO settings coming from the `home` item
# type stored in DatoCMS
create_post "src/index.md" do
  frontmatter :yaml, {
    seo_meta_tags: dato.home.seo_meta_tags,
    layout: 'home',
    pagination: { enabled: true, collection: 'works' }
  }
end

# Create a markdown file from the content of the `about_page` item type
create_post "src/about.md" do
  frontmatter :yaml, {
    title: dato.about_page.title,
    subtitle: dato.about_page.subtitle,
    photo: dato.about_page.photo.url(w: 800, fm: 'jpg', auto: 'compress'),
    layout: 'about',
    seo_meta_tags: dato.about_page.seo_meta_tags,
  }

  content dato.about_page.bio
end

# Create a `_works` directory (or empty it if already exists)...
directory "src/_works" do
  # ...and for each of the works stored online...
  dato.works.each_with_index do |work, index|
    # ...create a markdown file with all the metadata in the frontmatter
    create_post "#{work.slug}.md" do
      frontmatter :yaml, {
        layout: 'work',
        collection: 'works',
        title: work.title,
        cover_image: work.cover_image.url(w: 450, fm: 'jpg', auto: 'compress'),
        detail_image: work.cover_image.url(w: 600, fm: 'jpg', auto: 'compress'),
        position: index,
        excerpt: work.excerpt,
        seo_meta_tags: work.seo_meta_tags,
        extra_images: work.gallery.map do |image|
          image.url(h: 300, fm: 'jpg', auto: 'compress')
        end
      }

      content work.description
    end
  end
end

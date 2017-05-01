xml.instruct! :xml, :version => "1.0"
xml.urlset "xmlns" => "https://www.sitemaps.org/schemas/sitemap/0.9" do
  for game in @games do
    xml.url do
      xml.loc game_url(game)
      xml.lastmod game.updated_at.to_date
      xml.changefreq "monthly"
      xml.priority "0.5"
    end
  end
end

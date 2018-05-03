module NotesHelper
  def url_scraping(url)
    agent = Mechanize.new
    page = agent.get(url)
    content = page.at('mata[property="og:description"]')
    image = page.at('mata[property="og:image"]')
    title = page.at('mata[property="og:title"]')
  end
end

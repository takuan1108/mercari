class Scraping
  def self.gets_prefectures
    agent = Mechanize.new
    page = agent.get("http://www.mhl.janis.or.jp/~naruhiko/i/zips/00zip_top.html")
    elements = page.search("dl dd a")
      elements.each do |ele|
      prefecture = ele.inner_text
    prefecture = Prefecture.new(prefecture: prefecture)
    prefecture.save
    end
  end
  def self.gets_brands
    agent = Mechanize.new
    page = agent.get("https://www.mercari.com/jp/brand/")
    elements = page.search(".brand-list-initial-box-brand-name div p")
      elements.each do |ele|
      brand = ele.inner_text
    brand = Brand.new(brand: brand)
    brand.save
    end
  end
end

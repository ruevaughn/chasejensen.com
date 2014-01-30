module StaticHelper
  def pre_article(body)
    max = 60
    body.split(' ')[0,max].join(' ') + "..."
  end
end

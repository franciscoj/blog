class ResponsiveImgTag < Liquid::Tag
  def initialize(tag_name, img, tokens)
    super
    @img = img
  end

  def render(context)
    <<-IMG
<img class='img-responsive img-thumbnail' src='/assets/#{@img}'>
    IMG
  end
end
Liquid::Template.register_tag('responsive_img', ResponsiveImgTag)


class ShoutboxWidget < Apotomo::Widget
  before_filter :should_show_form
  responds_to_event :write
  
  def display
    @shouts = Shout.last(100)
    render
  end
  
  def write(event)
    s = Shout.new
    s.text = event[:text]
    s.user = options[:current_user]
    

    if s.save
      @shouts = Shout.find(:all)
      replace :view => :display
    else
      render :text => 'alert("{'+options[:current_user]+'} '+ s.errors.full_messages.join(_("and")) + '");'
    end
  end

  private

  def should_show_form
    @show_form = options[:current_user] != nil
  end
    

end

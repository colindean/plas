class ShoutboxWidget < Apotomo::Widget
  responds_to_event :write
  
  def display
    @shouts = Shout.find(:all)
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
    

end

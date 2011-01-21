# Controller for the infobot leaf.

class Controller < Autumn::Leaf

  # Typing "!about" displays some basic information about this leaf.

  def about_command(stem, sender, reply_to, msg)
    # This method renders the file "about.txt.erb"
  end

  def info_command(stem, sender, reply_to, msg)
    case msg
    when nil
      render :help
    when "help"
      render :help
    else
      info msg
    end
  end

  def info(lookup)
    var message: find_message(lookup)
  end

  def help
  end

  def find_message(key)
    dict = {
      callin: "Dial 855-855-0535 to talk to Dan on 'The Daily Edition'.",
      iphone: "Visit http://5by5.fm on your iOS device to listen live.",
      ios: "Visit http://5by5.fm on your iOS device to listen live.",
      nick: "Type '/nick newnick' to change your name.",
      watch: "On your computer: http://5by5.tv/live. On your iOS device: http://5by5.fm. In iTunes: Advanced, Open Audio Stream, listen.5by5.tv."
    }
    unless dict[key.to_sym].nil?
      return dict[key.to_sym]
    else
      return "I'm sorry, I don't have any information about #{key}."
    end
  end

end

class User < ActiveRecord::Base
  has_one :widget
  has_many :bug_reports
  before_create :set_unique_key

  def set_unique_key
    self.unique_key = SecureRandom.hex(5)
  end

  def generate_script
    script = <<-script_heredoc
      <script type="text/javascript">
        var _fly_swatter_id = "#{self.unique_key}";
        (function() {
          var fs = document.createElement('script'); 
          fs.type = 'text/javascript'; fs.async = true;;
          fs.src = 'http://localhost:3001/fly_swatter.js';
          var s = document.getElementsByTagName('script')[0]; 
          s.parentNode.insertBefore(fs, s);

          var link  = document.createElement('link');
          var head  = document.getElementsByTagName('head')[0];
          link.rel  = 'stylesheet';
          link.type = 'text/css';
          link.href = 'http://localhost:3001/fly_swatter.css';
          link.media = 'all';
          head.appendChild(link);
        })();
      </script>
    script_heredoc

    return script
  end

end

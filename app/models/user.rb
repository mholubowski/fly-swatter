class User < ActiveRecord::Base
  has_secure_password
  # attr_accessible :email, :password, :password_confirmation

  has_one :widget
  has_many :bug_reports
  before_create :set_unique_key
  before_save :create_remember_token

   validates :email, format: {
        with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
        message: "Please enter a valid Email" }

  validates :password,
  presence: true,
  length: { in: 6..20 }

  validates :password_confirmation,
  presence: true,
  length: { in: 6..20 }



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

  private
  def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end

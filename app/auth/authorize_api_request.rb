class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def call
    {
      user: user,
    }
  end

  private

  attr_reader headers

  def user
    @user ||= User.find(decoded_token[:user_id]) if decoded_token
  rescue ActiveRecord::RecordNotFound => e
    raise(ExceptionHandler::InvalidToken ("#{Message.invalid_token} #{e.message}"))
  end

  def decoded_token
    @decoded_token ||= JsonWebToken.decode(http_headers)
  end

  def http_headers
    if headers["authorization"].present?
      return headers["authorization"].split(" ").last
    end
    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end

module ApiResponse
  def ApiResponseSuccess(data, message='Success')
    render json: {Data: data, Status: 'Success', Message: message}
  end

  def ApiResponseFailure(name, message='')
    data = RESPONSE['Exceptions'][name]
    if name == 'ValidationError'
      data[:Data] = message if !message.blank?
    end
    data[:Type] = name
    render json: {Status: 'Failure', Error: data}
  end
end

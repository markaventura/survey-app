module Sessions
  class Builder

    def basic_details  obj
      {
        obj: obj, 
        access_token: obj.current_token
      }
    end

  end
end

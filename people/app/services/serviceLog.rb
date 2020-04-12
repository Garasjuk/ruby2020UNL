class ServiceLog

  def initialize (params)
    @id = params[:id]
    @name = params[:name]
    @name_before = params[:name_before]
    @type = params[:type]
    @type_before = params[:type_before]
  end

  def userUpdate(params = {})
    ActiveRecord::Base.transaction do
      @user = User.find(@id)
      @user.update(users_attributes)
      @log = Log.create(logs_attributes)
      @log.save
    end
  end

  def userCreate
    ActiveRecord::Base.transaction do
      @user = User.create(users_attributes)
      @user.save
      @log = Log.create(logs_attributes)
      @log.save
    end
  end

  def userDestroy(params)
      ActiveRecord::Base.transaction do
        @user = User.find(@id)
        @user.destroy
      end
  end

  private
   attr_reader :id, :name, :name_before, :type, :type_before

   def users_attributes
    {
      name: name,
      type: type
    }
  end

   def logs_attributes
    {
      name: name,
      name_before: name_before,
      kind: type,
      kind_before: type_before
    }
  end

end

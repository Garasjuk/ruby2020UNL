class ServiceDel

  def initialize (id)
    @id = id
    @kind = 'delete'
  end

  def userDestroy
      ActiveRecord::Base.transaction do
        @user = User.find(@id)
        user_params = {:name => @user.name, :kind => @kind}
        @log = Log.create(user_params)
        @user.destroy
        @log.save

      end
  end


  private
   attr_reader :id, :kind


end

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    if user
      true
    else 
      false
    end
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    if current_user.email == 'pepe@yahoo.es'
      true
    else
      false
    end

  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end


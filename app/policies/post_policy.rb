PostPolicy = Struct.new(:user, :post) do
  Scope = Struct.new(:user, :scope) do
    def resolve
      if user.editor?
        scope.all?
      else
        scope.where(:published => true)
      end
    end
  end

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index
    @posts = policy_scope(Post)
  end

  def show
    @posts = policy_scope(Post)
  end

  def create?
    user.author? || user.editor?
  end

  def update?
    user.author? || user.editor?
  end

  def destroy?
    user.editor?
  end
end

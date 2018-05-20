class UsersController < ActionController::Base
  layout "wizard_sidebar"

  def index
    @users = Users.all
  end

  def new
    @wizard = ModelWizard.new(User, session, params).start
    @user = @wizard.object
  end

  def create
    @wizard = ModelWizard.new(User, session, params, user_params).continue
    @user = @wizard.object
    if @wizard.save
      redirect_to @user, notice: "User created!"
    else
      render :new
    end
  end

  def update
    @wizard = ModelWizard.new(@user, session, params,  user_params).continue
    if @wizard.save
      redirect_to @user, notice: 'User updated.'
    else
      render :edit
    end
  end

  private

  def load_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    return params unless params[:user]

    params.require(:user).permit(:current_step,
      :first_name,
      :last_name,
      :dob,
      spouse: [:age, :first_name, :last_name],
      child: [:age, :first_name, :last_name]
    )
  end

end

class MembersController < InheritedResources::Base
before_action :authenticate_member!


  private

    def member_params
      params.require(:member).permit(:name, :age_group_id, :membership_id, :lesson)
    end
end


class TimeslotsController < InheritedResources::Base

  private

    def timeslot_params
      params.require(:timeslot).permit(:start)
    end
end


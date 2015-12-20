class PatientsController < ApplicationController


  def create
    #creating a new patient that is associated with the cookie on the surgeon's browser
    @patient = Patient.new(name: params[:patient][:name], hospital: params[:patient][:hospital],
      surgeon: "#{session[:user_id]}")
    
    if @patient.save
      flash[:success] = "You successfully added #{@patient.name}"
      redirect_to current_user
    else
      flash[:danger] = "Patient #{@patient.name} was not saved"
      redirect_to current_user
    end
  end

  def curl_post_request
    key = params[:api_key]
    patient = params[:name]
    surgeon_id = params[:surgeon_id]
    devices = params[:device]
    hospital = params[:hospital]
    patient_id = params[:patient_id]
    annotation = params[:annotation]

    if key == "SDFHJkjhGRDfghjTRDFghj" #key matches
      if patient_id && surgeon_id && devices  #correct parameters supplied
        patient_model = Patient.find(patient_id)

        if patient_model.surgeon!=surgeon_id #requesting surgeon owns patient 
          return render text: "FORBIDDEN TO EDIT THIS CLIENT - RESPONSE 403\n"
        else
          patient_model.assign_attributes(device: devices, annotation: annotation)
          if patient_model.save #checking to see if patient notes were actually saved to DB
            return render text: "Success! Patient notes were saved under #{User.find(surgeon_id).name}\n"
          else
            return render text: "For some reason #{User.find(surgeon_id).name} could not be saved - 500 Internal Service\n"
          end
        end
      else
        return render text: "INVALID DATA - One or more parameters were missing or incorrectly formatted\n"
      end
    else
      return render text: "INVALID API KEY - CHECK GITHUB FOR CORRECT EXAMPLE\n"
    end
    return render text: "Invalid Request - 401\n"
  end

  #the following methods protect agaisnt cross site scripting attacks
  def patient_params
    params.require(:patient).permit(:name, :hospital)
  end
end

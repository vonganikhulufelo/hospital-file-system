class AccessPolicy
  include AccessGranted::Policy

  def configure
    role :administrator, { role: "administrator" } do
        can [:create,:read], Ward
        can [:create, :manage], Pharmacy
        can [:create,:update], Pharmacist
        can [:create,:update], Doctor
        can [:create,:update], Receptionist
        can [:create, :update], Nurse
        can :update, Hospital
        can :update, Administrator
    end

    role :receptionist, proc { |receptionist| receptionist.role == "receptionist"} do
        can :create, Patient
        can :update, Receptionist
    end

    role :doctor, proc { |doctor| doctor.role == 'doctor'} do
        can :update, Doctor
        can :manage, Patient
    end

    role :nurse, proc { |nurse| nurse.role == "nurse"} do
        can :update, Nurse
        can :read, Ward
    end

    role :pharmacist, proc { |pharmacist| pharmacist.role == "pharmacist"} do
        can :update, Pharmacist
    end
  end
end

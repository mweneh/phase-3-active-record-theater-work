class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        auditions.all.map(&:actor)
    end

    def locations
        auditions.all.map(&:location)
    end

    def lead 
        if auditions.where(hired: true).size > 0
            auditions.where(hired: true)[0]
        else
            'no actor has been hired for this role'
        end
    end
    def understudy
        if auditions.where(hired: true).size > 1
            auditions.where(hired: true)[1]
        else
            'no actor has been hired for this role'
        end
    end
end
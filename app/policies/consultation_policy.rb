class ConsultationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.patient == user || user.coaches.includes?(record.patient)
  end

  def new?
    true
  end

  def create?
    record.patient == user
  end

  def edit?
    true
  end

  def update?
    record.patient == user
  end

  def destroy?
    record.patient == user
  end
end

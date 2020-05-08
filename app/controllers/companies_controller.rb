# frozen_string_literal: true

class CompaniesController < CrudController
  self.permitted_attrs = %i[name]
  self.nested_models = %i[people]

  def fetch_entries
    super.includes(:people)
  end
end

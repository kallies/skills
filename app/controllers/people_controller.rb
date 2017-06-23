# encoding: utf-8

class PeopleController < CrudController
  self.permitted_attrs = [:birthdate, :picture, :language, :location,
                          :martial_status, :updated_by, :name, :origin, :role, :title,
                          :competences, :status_id, :variation_name]

  self.nested_models = [:advanced_trainings, :activities, :projects,
                        :educations]

  skip_before_action :authorize, only: [:picture]

  def index
    people = fetch_entries
    people = people.search(params[:q]) if params[:q].present?

    render json: people, each_serializer: PeopleSerializer
  end

  def show
    format_odt? ? export : super
  end

  def update_picture
    person.update_attributes(picture: params[:picture])
    render json: { data: { picture_path: person_picture_path(params[:person_id]) } }
  end

  def picture
    default_avatar_url = "#{Rails.public_path}/default_avatar.png"
    picture_url = person.picture.file.nil? ? default_avatar_url : person.picture.url
    send_file(picture_url, disposition: 'inline')
  end

  def export_fws
    return render status: 404 unless format_odt?

    discipline = params['discipline']
    odt_file = Odt::Fws.new(discipline, params[:person_id]).export
    send_data odt_file.generate,
      type: 'application/vnd.oasis.opendocument.text',
      disposition: 'attachment',
      filename: fws_filename(discipline, person.name)
  end

  def export_empty_fws
    return render status: 404 unless format_odt?

    discipline = params['discipline']
    odt_file = Odt::Fws.new(discipline).empty_export

    send_data odt_file.generate,
      type: 'application/vnd.oasis.opendocument.text',
      disposition: 'attachment',
      filename: empty_fws_filename(discipline)
  end

  private

  def person
    @person ||= Person.find(params[:person_id])
  end

  def fws_filename(discipline, name)
    formatted_name = name.downcase.tr(' ', '-') 
    if discipline == 'development'
      "fachwissensskala-entwicklung-#{formatted_name}.odt"
    else
      "fachwissensskala-sys-#{formatted_name}.odt"
    end
  end

  def empty_fws_filename(discipline)
    if discipline == 'development'
      'fachwissensskala-entwicklung.odt'
    else
      'fachwissensskala-sys.odt'
    end
  end

  def export
    odt_file = Odt::Cv.new(entry).export
    send_data odt_file.generate,
      type: 'application/vnd.oasis.opendocument.text',
      disposition: 'attachment',
      filename: filename(entry.name)
  end

  def filename(name)
    "#{name.downcase.tr(' ', '_')}_cv.odt"
  end

  def format_odt?
    response.request.filtered_parameters['format'] == 'odt'
  end

end

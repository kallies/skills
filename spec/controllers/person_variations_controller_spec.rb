require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PersonVariationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # PersonVariation. As you add validations to PersonVariation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PersonVariationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all person_variations as @person_variations" do
      person_variation = PersonVariation.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:person_variations)).to eq([person_variation])
    end
  end

  describe "GET #show" do
    it "assigns the requested person_variation as @person_variation" do
      person_variation = PersonVariation.create! valid_attributes
      get :show, params: {id: person_variation.to_param}, session: valid_session
      expect(assigns(:person_variation)).to eq(person_variation)
    end
  end

  describe "GET #new" do
    it "assigns a new person_variation as @person_variation" do
      get :new, params: {}, session: valid_session
      expect(assigns(:person_variation)).to be_a_new(PersonVariation)
    end
  end

  describe "GET #edit" do
    it "assigns the requested person_variation as @person_variation" do
      person_variation = PersonVariation.create! valid_attributes
      get :edit, params: {id: person_variation.to_param}, session: valid_session
      expect(assigns(:person_variation)).to eq(person_variation)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new PersonVariation" do
        expect {
          post :create, params: {person_variation: valid_attributes}, session: valid_session
        }.to change(PersonVariation, :count).by(1)
      end

      it "assigns a newly created person_variation as @person_variation" do
        post :create, params: {person_variation: valid_attributes}, session: valid_session
        expect(assigns(:person_variation)).to be_a(PersonVariation)
        expect(assigns(:person_variation)).to be_persisted
      end

      it "redirects to the created person_variation" do
        post :create, params: {person_variation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(PersonVariation.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved person_variation as @person_variation" do
        post :create, params: {person_variation: invalid_attributes}, session: valid_session
        expect(assigns(:person_variation)).to be_a_new(PersonVariation)
      end

      it "re-renders the 'new' template" do
        post :create, params: {person_variation: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested person_variation" do
        person_variation = PersonVariation.create! valid_attributes
        put :update, params: {id: person_variation.to_param, person_variation: new_attributes}, session: valid_session
        person_variation.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested person_variation as @person_variation" do
        person_variation = PersonVariation.create! valid_attributes
        put :update, params: {id: person_variation.to_param, person_variation: valid_attributes}, session: valid_session
        expect(assigns(:person_variation)).to eq(person_variation)
      end

      it "redirects to the person_variation" do
        person_variation = PersonVariation.create! valid_attributes
        put :update, params: {id: person_variation.to_param, person_variation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(person_variation)
      end
    end

    context "with invalid params" do
      it "assigns the person_variation as @person_variation" do
        person_variation = PersonVariation.create! valid_attributes
        put :update, params: {id: person_variation.to_param, person_variation: invalid_attributes}, session: valid_session
        expect(assigns(:person_variation)).to eq(person_variation)
      end

      it "re-renders the 'edit' template" do
        person_variation = PersonVariation.create! valid_attributes
        put :update, params: {id: person_variation.to_param, person_variation: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested person_variation" do
      person_variation = PersonVariation.create! valid_attributes
      expect {
        delete :destroy, params: {id: person_variation.to_param}, session: valid_session
      }.to change(PersonVariation, :count).by(-1)
    end

    it "redirects to the person_variations list" do
      person_variation = PersonVariation.create! valid_attributes
      delete :destroy, params: {id: person_variation.to_param}, session: valid_session
      expect(response).to redirect_to(person_variations_url)
    end
  end

end

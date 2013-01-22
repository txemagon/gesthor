require 'spec_helper'

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

describe TrainingLevelsController do

  # This should return the minimal set of attributes required to create a valid
  # TrainingLevel. As you add validations to TrainingLevel, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name => "Area Name",
     :short_name => "AN",
     :url => "http://www.google.es" }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TrainingLevelsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all training_levels as @training_levels" do
      training_level = TrainingLevel.create! valid_attributes
      get :index, {}, valid_session
      assigns(:training_levels).should eq([training_level])
    end
  end

  describe "GET show" do
    it "assigns the requested training_level as @training_level" do
      training_level = TrainingLevel.create! valid_attributes
      get :show, {:id => training_level.to_param}, valid_session
      assigns(:training_level).should eq(training_level)
    end
  end

  describe "GET new" do
    it "assigns a new training_level as @training_level" do
      get :new, {}, valid_session
      assigns(:training_level).should be_a_new(TrainingLevel)
    end
  end

  describe "GET edit" do
    it "assigns the requested training_level as @training_level" do
      training_level = TrainingLevel.create! valid_attributes
      get :edit, {:id => training_level.to_param}, valid_session
      assigns(:training_level).should eq(training_level)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TrainingLevel" do
        expect {
          post :create, {:training_level => valid_attributes}, valid_session
        }.to change(TrainingLevel, :count).by(1)
      end

      it "assigns a newly created training_level as @training_level" do
        post :create, {:training_level => valid_attributes}, valid_session
        assigns(:training_level).should be_a(TrainingLevel)
        assigns(:training_level).should be_persisted
      end

      it "redirects to the created training_level" do
        post :create, {:training_level => valid_attributes}, valid_session
        response.should redirect_to(TrainingLevel.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved training_level as @training_level" do
        # Trigger the behavior that occurs when invalid params are submitted
        TrainingLevel.any_instance.stub(:save).and_return(false)
        post :create, {:training_level => {}}, valid_session
        assigns(:training_level).should be_a_new(TrainingLevel)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TrainingLevel.any_instance.stub(:save).and_return(false)
        post :create, {:training_level => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested training_level" do
        training_level = TrainingLevel.create! valid_attributes
        # Assuming there are no other training_levels in the database, this
        # specifies that the TrainingLevel created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TrainingLevel.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => training_level.to_param, :training_level => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested training_level as @training_level" do
        training_level = TrainingLevel.create! valid_attributes
        put :update, {:id => training_level.to_param, :training_level => valid_attributes}, valid_session
        assigns(:training_level).should eq(training_level)
      end

      it "redirects to the training_level" do
        training_level = TrainingLevel.create! valid_attributes
        put :update, {:id => training_level.to_param, :training_level => valid_attributes}, valid_session
        response.should redirect_to(training_level)
      end
    end

    describe "with invalid params" do
      it "assigns the training_level as @training_level" do
        training_level = TrainingLevel.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TrainingLevel.any_instance.stub(:save).and_return(false)
        put :update, {:id => training_level.to_param, :training_level => {}}, valid_session
        assigns(:training_level).should eq(training_level)
      end

      it "re-renders the 'edit' template" do
        training_level = TrainingLevel.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TrainingLevel.any_instance.stub(:save).and_return(false)
        put :update, {:id => training_level.to_param, :training_level => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested training_level" do
      training_level = TrainingLevel.create! valid_attributes
      expect {
        delete :destroy, {:id => training_level.to_param}, valid_session
      }.to change(TrainingLevel, :count).by(-1)
    end

    it "redirects to the training_levels list" do
      training_level = TrainingLevel.create! valid_attributes
      delete :destroy, {:id => training_level.to_param}, valid_session
      response.should redirect_to(training_levels_url)
    end
  end

end
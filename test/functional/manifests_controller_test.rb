require 'test_helper'

class ManifestsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:manifests)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_manifest
    assert_difference('Manifest.count') do
      post :create, :manifest => { }
    end

    assert_redirected_to manifest_path(assigns(:manifest))
  end

  def test_should_show_manifest
    get :show, :id => manifests(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => manifests(:one).id
    assert_response :success
  end

  def test_should_update_manifest
    put :update, :id => manifests(:one).id, :manifest => { }
    assert_redirected_to manifest_path(assigns(:manifest))
  end

  def test_should_destroy_manifest
    assert_difference('Manifest.count', -1) do
      delete :destroy, :id => manifests(:one).id
    end

    assert_redirected_to manifests_path
  end
end

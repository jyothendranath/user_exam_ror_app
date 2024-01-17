require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    let(:college) { create(:college) }
    let(:exam) { create(:exam, college: college, exam_window: create(:exam_window)) }

    context 'with valid params' do
      let(:valid_params) do
        {
          first_name: 'John',
          last_name: 'Doe',
          phone_number: '1234567890',
          college_id: college.id,
          exam_id: exam.id,
          start_time: exam.exam_window.start_time + 1.hour
        }
      end

      it 'creates a new user and associates with the exam' do
        post :create, params: valid_params
        expect(response).to have_http_status(:ok)
        expect(json_response['message']).to eq('User successfully created and associated with the exam')
      end
    end

    context 'with invalid params' do
      it 'returns a bad request status' do
        post :create, params: { first_name: 'John' }
        expect(response).to have_http_status(:bad_request)
        expect(json_response['error']).to eq('Invalid request data')
      end
    end

    context 'when college not found' do
      it 'returns a bad request status' do
        post :create, params: { college_id: 999 }
        expect(response).to have_http_status(:bad_request)
        expect(json_response['error']).to eq('College not found')
      end
    end

    context 'when exam not found' do
      it 'returns a bad request status' do
        post :create, params: { college_id: college.id, exam_id: 999 }
        expect(response).to have_http_status(:bad_request)
        expect(json_response['error']).to eq('Exam not found or does not belong to the college')
      end
    end

    context 'when start time is not within the exam window' do
      it 'returns a bad request status' do
        post :create, params: { college_id: college.id, exam_id: exam.id, start_time: exam.exam_window.start_time - 1.hour }
        expect(response).to have_http_status(:bad_request)
        expect(json_response['error']).to eq('Invalid start time. It does not fall within the exam\'s time window.')
      end
    end
  end
end

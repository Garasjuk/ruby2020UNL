require 'swagger_helper'

RSpec.describe 'api/my', type: :request do









  	path '/Users' do
  		post 'Add user' do
  			tags 'Users'
  			consumes 'application/json'
  			parameter name: :id, in: :body, schema: {
  				type: :object,
  				properties: {
  					name: { type: :string },
  					password: { type: :string }
  				},
  				required: [ 'name', 'password' ]
  			}

  			response '201', 'user created' do
  				let(:user) { { name: 'foo', type: 'bar' } }
  				run_test!
  			end
        response '401' , 'UnauthorizedError' do
          run_test!
        end
  			response '422', 'invalid request' do
  				let(:user) { { name: 'foo' } }
  				run_test!
  			end
  		end
  		get 'All user' do
  			tags 'Users'
  			produces 'application/json', 'application/xml'
  			parameter name: :id, in: :path, type: :string
  			response '200', 'user found' do
  				schema type: :object,
  				properties: {
  					name: { type: :string },
  					type: { type: :string }
  				},
  				required: [ 'id', 'name', 'type' ]

  				let(:id) { User.create(name: 'foo', type: 'bar').id }
  				run_test!
  			end
        response '401' , 'UnauthorizedError' do
  				run_test!
  			end
  			response '404', 'user not found' do
  				let(:id) { 'invalid' }
  				run_test!
  			end
  			response '406', 'unsupported accept header' do
  				let(:'Accept') { 'application/foo' }
  				run_test!
  			end
  		end
  	end
  	path '/users/{id}' do
  		get 'Get user by id' do
  			tags 'Users'
  			produces 'application/json', 'application/xml'
  			parameter name: :id, in: :path, type: :string
  			response '200', 'user found' do
  				schema type: :object,
  				properties: {
  					name: { type: :string },
  					type: { type: :string }
  				},
  				required: [ 'id', 'name', 'type' ]

  				let(:id) { User.create(name: 'foo', type: 'bar').id }
  				run_test!
  			end
        response '401' , 'UnauthorizedError' do
  				run_test!
  			end
  			response '404', 'user not found' do
  				let(:id) { 'invalid' }
  				run_test!
  			end
  			response '406', 'unsupported accept header' do
  				let(:'Accept') { 'application/foo' }
  				run_test!
  			end
  		end
  		delete 'Delete user' do
  			tags 'Users'
  			produces 'application/json', 'application/xml'
  			parameter name: :id, in: :path, type: :string
        response '401' , 'UnauthorizedError' do
          run_test!
        end
  			response '404', 'user not found' do
  				let(:id) { 'invalid' }
  				run_test!
  			end
  			response '400', 'Invalid ID' do
  				let(:id) { 'Invalid ID' }
  				run_test!
  			end
  		end
  	end
  	path '/users/new' do
  		put 'Update a user' do
  			tags 'Users'
  			consumes 'application/json'
  			parameter name: :command, in: :body, schema: {
  				type: :object,
  				properties: {
  					name: { type: :string },
  					type: { type: :string }
  				},
  				required: [ 'name', 'type' ]
  			}
  			response '201', 'user update' do
  				let(:user) { { name: 'foo', region: 'bar' } }
  				run_test!
  			end
        response '401' , 'UnauthorizedError' do
  				run_test!
  			end
  			response '404', 'User not found' do
  				let(:user) { { name: 'foo' } }
  				run_test!
  			end
  			response '422', 'invalid request' do
  				let(:user) { { name: 'foo' } }
  				run_test!
  			end
  		end
  	end


  	path '/friend' do
  		get 'Get all friend' do
  			tags 'Friend'
  			produces 'application/json'
  			parameter name: :id, in: :path, type: :string
  			response '200', 'user found' do
  				schema type: :object,
  				properties: {
  					name: { type: :string },
  					type: { type: :string }
  				},
  				required: ['name', 'type']

  				let(:id) { Friend.create(name: 'foo', type: 'bar').id }
  				run_test!
  			end
        response '401' , 'UnauthorizedError' do
  				run_test!
  			end
  			response '404', 'user not found' do
  				let(:id) { 'invalid' }
  				run_test!
  			end
  			response '406', 'unsupported accept header' do
  				let(:'Accept') { 'application/foo' }
  				run_test!
  			end
      end
    path '/friend/{id}' do
      put 'Update a friend' do
  			tags 'Friend'
  			consumes 'application/json'
        parameter name: :id, in: :path, type: :string
        response '200', 'friend found' do
  				schema type: :object,
  				properties: {
  					name: { type: :string },
  					type: { type: :string }
  				},
  				required: [ 'id', 'name', 'type' ]

  				let(:id) { User.create(name: 'foo', type: 'bar').id }
  				run_test!
  			end

  			response '201', 'friend update' do
  				let(:friend) { { name: 'foo', type: 'bar' } }
  				run_test!
  			end
        response '401' , 'UnauthorizedError' do
  				run_test!
  			end
  			response '404', 'Friend not found' do
  				let(:friend) { { name: 'foo' } }
  				run_test!
  			end
  			response '422', 'invalid request' do
  				let(:friend) { { name: 'foo' } }
  				run_test!
  			end
  		end

      delete 'Delete friend' do
  			tags 'Friend'
  			produces 'application/json', 'application/xml'
  			parameter name: :id, in: :path, type: :string
        response '401' , 'UnauthorizedError' do
          run_test!
        end
  			response '404', 'friend not found' do
  				let(:id) { 'invalid' }
  				run_test!
  			end
  			response '400', 'Invalid ID' do
  				let(:id) { 'Invalid ID' }
  				run_test!
  			end
  		end
    end
      path '/neutrality' do
    		get 'Get all neutrality' do
    			tags 'Neutrality'
    			produces 'application/json'
    			parameter name: :id, in: :path, type: :string
    			response '200', 'neutrality found' do
    				schema type: :object,
    				properties: {
    					name: { type: :string },
    					type: { type: :string }
    				},
    				required: ['name', 'type']

    				let(:id) { Neutrality.create(name: 'foo', type: 'bar').id }
    				run_test!
    			end
          response '401' , 'UnauthorizedError' do
    				run_test!
    			end
    			response '404', 'neutrality not found' do
    				let(:id) { 'invalid' }
    				run_test!
    			end
    			response '406', 'unsupported accept header' do
    				let(:'Accept') { 'application/foo' }
    				run_test!
    			end
        end
  	   end


       path '/neutrality/{id}' do
         put 'Update a neutrality' do
           tags 'Neutrality'
           consumes 'application/json'
           parameter name: :id, in: :path, type: :string
           response '200', 'neutrality found' do
             schema type: :object,
             properties: {
               name: { type: :string },
               type: { type: :string }
             },
             required: [ 'id', 'name', 'type' ]

             let(:id) { Neutrality.create(name: 'foo', type: 'bar').id }
             run_test!
           end

           response '201', 'neutrality update' do
             let(:neutrality) { { name: 'foo', type: 'bar' } }
             run_test!
           end
           response '401' , 'UnauthorizedError' do
     				run_test!
     			end
           response '404', 'neutrality not found' do
             let(:neutrality) { { name: 'foo' } }
             run_test!
           end
           response '422', 'invalid request' do
             let(:neutrality) { { name: 'foo' } }
             run_test!
           end
         end

         delete 'Delete friend' do
           tags 'Neutrality'
           produces 'application/json', 'application/xml'
           parameter name: :id, in: :path, type: :string
           response '401' , 'UnauthorizedError' do
             run_test!
           end
           response '404', 'neutrality not found' do
             let(:id) { 'invalid' }
             run_test!
           end
           response '400', 'Invalid ID' do
             let(:id) { 'Invalid ID' }
             run_test!
           end
         end
       end

    path '/enemy' do
      get 'Get all enemy' do
        tags 'Enemy'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
        response '200', 'enemy found' do
          schema type: :object,
          properties: {
            name: { type: :string },
            type: { type: :string }
          },
          required: ['name', 'type']

          let(:id) { Enemy.create(name: 'foo', type: 'bar').id }
          run_test!
        end
        response '401' , 'UnauthorizedError' do
  				run_test!
  			end
        response '404', 'enemy not found' do
          let(:id) { 'invalid' }
          run_test!
        end
        response '406', 'unsupported accept header' do
          let(:'Accept') { 'application/foo' }
          run_test!
        end
      end
    end

    path '/enemy/{id}' do
      put 'Update a enemy' do
        tags 'Enemy'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string
        response '200', 'enemy found' do
          schema type: :object,
          properties: {
            name: { type: :string },
            type: { type: :string }
          },
          required: [ 'id', 'name', 'type' ]

          let(:id) { Enemy.create(name: 'foo', type: 'bar').id }
          run_test!
        end

        response '201', 'enemy update' do
          let(:enemy) { { name: 'foo', type: 'bar' } }
          run_test!
        end
        response '401' , 'UnauthorizedError' do
  				run_test!
  			end
        response '404', 'enemy not found' do
          let(:enemy) { { name: 'foo' } }
          run_test!
        end
        response '422', 'invalid request' do
          let(:enemy) { { name: 'foo' } }
          run_test!
        end
      end

      delete 'Delete friend' do
        tags 'Enemy'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string
        response '401' , 'UnauthorizedError' do
          run_test!
        end
        response '404', 'enemy not found' do
          let(:id) { 'invalid' }
          run_test!
        end
        response '400', 'Invalid ID' do
          let(:id) { 'Invalid ID' }
          run_test!
        end
      end
    end

  end
end

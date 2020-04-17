require 'swagger_helper'

RSpec.describe 'api/my_controler', type: :request do

	path '/commands' do
		post 'Add command' do
			tags 'Commands'
			consumes 'application/json'
			parameter name: :id, in: :body, schema: {
				type: :object,
				properties: {
					name: { type: :string },
					region: { type: :string }
				},
				required: [ 'name', 'region' ]
			}

			response '201', 'command created' do
				let(:command) { { name: 'foo', region: 'bar' } }
				run_test!
			end

			response '422', 'invalid request' do
				let(:command) { { name: 'foo' } }
				run_test!
			end
		end
		get 'All a command' do
			tags 'Commands'
			produces 'application/json', 'application/xml'
			parameter name: :id, in: :path, type: :string
			response '200', 'command found' do
				schema type: :object,
				properties: {
					name: { type: :string },
					region: { type: :string }
				},
				required: [ 'id', 'name', 'region' ]

				let(:id) { Command.create(name: 'foo', region: 'bar').id }
				run_test!
			end
			response '404', 'command not found' do
				let(:id) { 'invalid' }
				run_test!
			end
			response '406', 'unsupported accept header' do
				let(:'Accept') { 'application/foo' }
				run_test!
			end
		end
	end
	path '/commands/{id}' do	
		get 'Get command by id' do
			tags 'Commands'
			produces 'application/json', 'application/xml'
			parameter name: :id, in: :path, type: :string
			response '200', 'command found' do
				schema type: :object,
				properties: {
					name: { type: :string },
					region: { type: :string }
				},
				required: [ 'id', 'name', 'region' ]

				let(:id) { Command.create(name: 'foo', region: 'bar').id }
				run_test!
			end
			response '404', 'command not found' do
				let(:id) { 'invalid' }
				run_test!
			end
			response '406', 'unsupported accept header' do
				let(:'Accept') { 'application/foo' }
				run_test!
			end
		end
		delete 'Delete a command' do
			tags 'Commands'
			produces 'application/json', 'application/xml'
			parameter name: :id, in: :path, type: :string
			
			response '404', 'command not found' do
				let(:id) { 'invalid' }
				run_test!
			end
			response '400', 'Invalid ID' do
				let(:id) { 'Invalid ID' }
				run_test!
			end
		end
	end
	path '/commands/new' do
		put 'Update a command' do
			tags 'Commands'
			consumes 'application/json'
			parameter name: :command, in: :body, schema: {
				type: :object,
				properties: {
					name: { type: :string },
					region: { type: :string }
				},
				required: [ 'name', 'region' ]
			}
			response '201', 'command update' do
				let(:command) { { name: 'foo', region: 'bar' } }
				run_test!
			end
			response '404', 'Command not found' do
				let(:command) { { name: 'foo' } }
				run_test!
			end
			response '422', 'invalid request' do
				let(:command) { { name: 'foo' } }
				run_test!
			end
		end
	end
	 
	path '/commands/{name}' do
		get 'Get command by name' do
			tags 'Commands'
			produces 'application/json', 'application/xml'
			parameter name: :name, in: :path, type: :string
			response '200', 'command found' do
				schema type: :object,
				properties: {
					name: { type: :string },
					region: { type: :string }
				},
				required: [ 'name', 'region' ]

				let(:id) { Command.create(name: 'foo', region: 'bar').id }
				run_test!
			end
			response '404', 'command not found' do
				let(:id) { 'invalid' }
				run_test!
			end
			response '406', 'unsupported accept header' do
				let(:'Accept') { 'application/foo' }
				run_test!
			end
		end
	end 
	path '/users' do
		get 'Get all users' do
			tags 'Users'
			produces 'application/json'
			parameter name: :id, in: :path, type: :string
			response '200', 'user found' do
				schema type: :object,
				properties: {
					name: { type: :string },
					phone: { type: :string },
					male: { type: :string }
				},
				required: ['name', 'phone', 'male']

				let(:id) { User.create(name: 'foo', phone: '1234567', male: 'm').id }
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
		
		put 'update a user' do
			tags 'Users'
			consumes 'application/json'
			parameter name: :body, in: :body, schema: {
				type: :object,
				properties: {
					name: { type: :string },
					phone: { type: :string },
					male: { type: :string }	
				},
				required: [ 'name', 'phone', 'male' ]
			}

			response '201', 'user create' do
				let(:user) { { name: 'foo', phone: '1234567', male: 'm' } }
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
	
	path '/users/new' do
		post 'new a user' do
			tags 'Users'
			consumes 'application/json'
			parameter name: :body, in: :body, schema: {
				type: :object,
				properties: {
					name: { type: :string },
					phone: { type: :string },
					male: { type: :string }	
				},
				required: [ 'name', 'phone', 'male' ]
			}

			response '201', 'user create' do
				let(:user) { { name: 'foo', phone: '1234567', male: 'm' } }
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
	
	path '/commands/{id}/users/{id}/edit' do
		put 'Update User' do
			tags 'Users'
			produces 'application/json'
			parameter name: :id, in: :path, type: :string
			response '200', 'user found' do
				schema type: :object,
				properties: {
					name: { type: :string },
					phone: { type: :string },
					male: { type: :string }	
				},
				required: [ 'name', 'phone', 'male' ]

				let(:id) { User.update(name: 'foo', phone: '1234567', male: 'm').id }
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
	path '/commands/{id}/users/{id}' do
		get 'Get user by id' do
			tags 'Users'
			produces 'application/json'
			parameter name: :id, in: :path, type: :string
			response '200', 'user found' do
				schema type: :object,
				properties: {
					name: { type: :string },
					phone: { type: :string },
					male: { type: :string }
				},
				required: [ 'name', 'phone', 'male' ]

				let(:id) { User.new(name: 'foo', phone: '1234567', male: 'm').id }
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
		delete 'Delete a user' do
			tags 'Users'
			produces 'application/json', 'application/xml'
			parameter name: :id, in: :path, type: :string
			
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
	
	path '/users/{name}' do
		get 'Get user by name' do
			tags 'Users'
			produces 'application/json'
			parameter name: :name, in: :path, type: :string
			response '200', 'user found' do
				schema type: :object,
				properties: {
					name: { type: :string },
					phone: { type: :string },
					male: { type: :string }
				},
				required: [ 'name', 'phone', 'male' ]

				let(:id) { User.new(name: 'foo', phone: '1234567', male: 'm').id }
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
	 
end

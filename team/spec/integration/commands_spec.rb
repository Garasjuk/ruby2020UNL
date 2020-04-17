describe 'Command API' do
	path '/commands' do
		post 'Creates a command' do
			tags 'Command'
			consumes 'application/json'
			parameter name: :blog, in: :body, schema: {
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
	end

	path '/comands/{id}' do

		get 'Retrieves a command' do
			tags 'Commands'
			produces 'application/json', 'application/xml'
			parameter name: :id, in: :path, type: :string

			response '200', 'command found' do
				schema type: :object,
				properties: {
					id: { type: :integer },
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
end
import React from 'react'
import ReactDOM from 'react-dom'
import '../App.css'
import BookContainer from '../components/BookContainer'

class App extends React.Component {

  constructor(props) {
    super(props)
  }
  render() {
    return (
      <>
        <div class="container">
          <div class="row">

            <BookContainer/>
          </div>
        </div>
      </>
    )
  }
}
export default App

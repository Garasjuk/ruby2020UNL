import React from 'react'
import ReactDOM from 'react-dom'
// import '../App.css'
import Login from '../components/Login'

class App extends React.Component {

  constructor(props) {
    super(props)
  }
  render() {
    return (
      <>
        <div class="container">
          <div class="row">

            <Login/>
          </div>
        </div>
      </>
    )
  }
}
export default App

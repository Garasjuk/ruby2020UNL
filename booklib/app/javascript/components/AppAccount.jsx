import React from 'react'
import ReactDOM from 'react-dom'
import '../App.css'
import BookAccount from '../components/BookAccount'

class AppAccount extends React.Component {

  constructor(props) {
    super(props)
  }
  render() {
    return (
      <>
        <div class="container">
          <div class="row">

            <BookAccount/>
          </div>
        </div>
      </>
    )
  }
}
export default AppAccount

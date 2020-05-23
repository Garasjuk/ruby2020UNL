import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'
// import BookForm from '../components/BookForm'
import bookHeader from '../images/imageBook.jpg';
// import {fetch} from 'whatwg-fetch'

class BookContainer extends Component {


  constructor(props) {
      super(props)
      this.state = {
        books: [],
        currentUser: [],
        choice: [],
        editingIdeaId: null,
        buttonIndexChoces: false,
        buttonIndexRead: false,
        notification: '',
        transitionIn: false
      }
    }

  componentDidMount() {
  axios.get('http://localhost:3000/books')
  .then(response => {
    console.log(response)
    this.setState({books: response.data})
  })
  .catch(error => console.log(error))

  axios.get('http://localhost:3000/get_current_user')
  .then(response => {
    console.log(response)
    this.setState({currentUser: response.data})
  })
  .catch(error => console.log(error))

  axios.get('http://localhost:3000/get_choice')
  .then(response => {
    console.log(response)
    this.setState({choice: response.data})
  })
  .catch(error => console.log(error))
}



addNewBook = () => {
  axios({
    method: 'post',
    url: 'http://localhost:3000/books',
     book: { title: 'qwe', author: 'asd' }
   })

}
deleteBook = (id) => {
  axios.delete('http://localhost:3000/books/${id}')
  .then(response => {
      const bookIndex = this.state.books.findIndex(x => x.id === id)
      const books = update(this.state.books, { $splice: [[bookIndex, 1]]})
      this.setState({books: books})
  })
  .catch(error => console.log(error))
}



  render() {
    return (
      <div>
        <button className="newBookButton" onClick={this.addNewBook} >
          New Book
        </button>

          {this.state.books.map((book) => {
            return(
                  <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                    <div className="tile" key={book.id} >
                      <img className="imageBook" src={ bookHeader } />

                      <h4>{book.title}</h4>

                      <p>Author: <b>{book.author}</b></p>

                        {this.state.choice.map((choice) => {
                          return(
                            <div>

                              {book.id === choice.book_id ?
                                <div>  {this.state.buttonIndexChoces = true} </div>
                                : <div>  </div>
                              }

                              {book.id === choice.book_id ?
                                choice.id_user ===  this.state.currentUser.id ?
                                  choice.chosen  ?
                                    <button className="bouton-image" onClick={this.editBook}><i class="icon-play-yes"></i></button>
                                    :
                                    <button className="bouton-image" onClick={this.editBook}><i class="icon-play-no"></i></button>
                                  : <div>  </div>
                                : <div>  </div>
                              }


                              {book.id === choice.book_id ?
                                  <div> {this.state.buttonIndexRead = true} </div>
                                : <div>  </div>
                              }

                              {book.id === choice.book_id ?
                                choice.id_user ===  this.state.currentUser.id ?
                                  choice.read  ?
                                    <button className="bouton-image" onClick={this.editBook}><i class="icon-read-yes"></i></button>
                                    :
                                    <button className="bouton-image" onClick={this.editBook}><i class="icon-read-no"></i></button>
                                : <div>   </div>
                              : <div> </div>

                              }


                            </div>
                          )
                        })}

                      



                      <button className="editBookButton" onClick={this.editBook}>Edit</button>
                      <button className="deleteBookButton" onClick={this.deleteBook}>Delete</button>
                    </div>
                  </div>
            )
          })}
      </div>

    )
  }
}

export default BookContainer

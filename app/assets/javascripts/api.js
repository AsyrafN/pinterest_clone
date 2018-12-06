// window.onload = function(){
//       // your code
//     // search form
//     const form = document.getElementById('search-form');
//     // text input field
//     const search = document.getElementById('search');
//     const list = document.getElementById('list-data')

//     // set onsubmit
//     form.onsubmit = function(event) {
//       event.preventDefault();

//       // get value in input field
//       const searchTerm = search.value;
//       getTaggedPhotos(searchTerm)
//       console.log(searchTerm)
//     }
//   function getTaggedPhotos(tagName) {
//     // <iframe src="https://giphy.com/embed/4Zo41lhzKt6iZ8xff9" width="480" height="480" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/4Zo41lhzKt6iZ8xff9">via GIPHY</a></p>
//     // fetch('https://api.tumblr.com/v2/tagged?tag=' + tagName + '&api_key=PWG4EfqjuqMrH76hGIB5RChBHovtC3jRBlDBP7tqCNZxKCppdX')
//     fetch('https://api.giphy.com/v1/gifs/search?q=' + tagName + '&api_key=LRwA7mE7VQR9JBNLboZJiVjZF9ljATnZ&limit=10')
//       .then(function(response) {
//         if (!response.ok){
//           window.alert('Hey, seems like something went wrong, please email <email address> for reports!');
//           return;
//         }
//         return response.json();
//       })
//       .then(function(result) {
//         if (!result){
//           return;
//         }
//         list.innerHTML = '';

//         const items = result.data;
//         for (let i = 0; i < items.length; i++) {

//           const item = items[i];
//           if (item.url != undefined) {
//             const iframe = document.createElement('iframe');
//             iframe.src = "https://giphy.com/embed/" + item.id
//             iframe.width="150"
//             iframe.height="150"
//             iframe.frameBorder="0"
//             iframe.class="giphy-embed"
//             iframe.allowFullScreen
//             console.log(iframe.src)
//             // console.log(items)
//             // console.log(item.id)
//             // console.log(img.src)
//             const li = document.createElement('li');
//             li.appendChild(iframe)

//             list.appendChild(li)
//           }
//         }
//       })
//       .catch(function(err) {
//         window.alert('Hey, seems like the Tumblr API is down, please try again later!')
//         console.log("Message: " + err)
//       })
//   }
// }
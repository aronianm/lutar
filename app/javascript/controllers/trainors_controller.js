import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect(){
    this.options = {
      'min': 0,
      'max': 999999999.99
    }
  }

  availableTrainorSearchMin(evt){
    var priceValue = parseFloat(event.target.value)
    this.options['min'] = priceValue
    this.filterAvailableTrainors()
  }
  availableTrainorSearchMax(evt){
    var priceValue = parseFloat(event.target.value)
    this.options['max'] = priceValue
    this.filterAvailableTrainors()
  }

  filterAvailableTrainors() {
    var options = this.options
    var trainorList = document.getElementById('trainorList')
    var trainors = trainorList.querySelectorAll('.trainor-object')
    for(var trainorIndex = 0; trainorIndex < trainors.length; trainorIndex++){
      var trainor = trainors[trainorIndex]
      var price = parseFloat(trainor.dataset.price)
      if(price > options['min'] && price < options['max']){
        trainor.style.display = ''
      }else{
        trainor.style.display = 'none'
      }
    }
    console.log(this.options)
  }
}

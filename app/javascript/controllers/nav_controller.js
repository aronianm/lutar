import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    
    this.notAactive =  `block py-2 pl-3 pr-4 text-gray-700 border-b border-gray-100 hover:bg-gray-50
                    lg:hover:bg-transparent lg:border-0 lg:hover:text-purple-700 lg:p-0 dark:text-gray-400
                    lg:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white lg:dark:hover:bg-transparent dark:border-gray-700
                    `
    this.active = `block  text-white bg-purple-700 rounded lg:bg-transparent lg:text-purple-700 dark:text-white`
    var elements = this.element.querySelectorAll('a')
    for(var i2 = 0; i2 < elements.length; i2++){
      if(elements[i2].href == window.location.href ){
        elements[i2].classList = this.active
      }else{
        elements[i2].classList = this.notActive
      }
    }
  }

  click(evt){
    var elements = this.element.querySelectorAll('a')
    for(var i2 = 0; i2 < elements.length; i2++){
      if(elements[i2].href == window.location.href ){

        elements[i2].classList = this.active
      }else{
        elements[i2].classList = this.notActive
      }
    }
  }

  closeDrawer(){
    var el = document.querySelector("#drawer-example")
    el.classList = 'fixed top-0 left-0 z-40 h-screen p-4 overflow-y-auto transition-transform bg-white w-80 dark:bg-gray-800 -translate-x-full'
    document.querySelector("div[drawer-backdrop]").remove()
  }
}

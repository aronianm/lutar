import { Controller } from "@hotwired/stimulus"
import  postData  from '../utilities/requestHelpers'

export default class extends Controller {
  static outlets = [ "exercise" ]

  connect() {
    this.workout = this.element.dataset.workout || {'name': "", 'workout_exercises': []}
    this.exerciseCount = -1

  }

  updateName(evt){
    this.workout.name = evt.target.value 
  }

  addWorkout(evt){  
    this.exerciseCount += 1
    var newWorkout = document.querySelectorAll("#workoutTemplate > .workout-exercise")[this.exerciseCount]
    newWorkout.classList.remove("hidden");
    this.workout.workout_exercises.push(this.exerciseOutlets[this.exerciseCount].exercise)
  }



  save(evt){
    var url = event.currentTarget.dataset.url
    postData(url, {'workout': this.workout}).then((data) => {
       console.log(data); // JSON data parsed by `data.json()` call
    });
  }
}

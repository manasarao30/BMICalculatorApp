
import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain=CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height=String(format: "%.2fm", sender.value)
        heightLabel.text=height
    }
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight=String(format: "%.0fKg", sender.value)
        weightLabel.text=weight
    }
    
 @IBAction func calculatePressed(_ sender: UIButton) {
        let height=heightSlider.value
        let weight=weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="goToResult"){
            let destinationVC=segue.destination as! ResultViewController
            destinationVC.bmiValue=calculatorBrain.getBMIValue()
            destinationVC.advice=calculatorBrain.getAdvice()
            destinationVC.color=calculatorBrain.getColor()
        }
    }
    
}


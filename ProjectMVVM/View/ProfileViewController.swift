
import UIKit

class ProfileViewController: UIViewController {
    
    let userViewModel: UserViewModel = UserViewModel()
    
    var user: User? = nil
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var lblNombre: UILabel!
    
    @IBOutlet weak var lblGenero: UILabel!
    
    @IBOutlet weak var lblCecular: UILabel!
    
    @IBOutlet weak var LblBirth: UILabel!
    
    @IBOutlet weak var LblContinente: UILabel!
    
    @IBOutlet weak var LblCity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await setUpData()
        }        // Do any additional setup after loading the view.
    }
    
    func setUpData() async {
        await userViewModel.getDataFromAPI()
        user = userViewModel.user
        setUpDataProfile()
    }
    
    func setUpDataProfile(){
    
        lblNombre.text = "\((user?.title.capitalized)!) \((user?.firstName)!) \((user?.lastName)!)"
        if(user?.gender == "female"){
            lblGenero.text = "Femenino"
        }else{
            lblGenero.text = "Masculino"
        }
        imageView.image = HelperImage.setImageFromUrl(url: (user?.picture)!)

        lblCecular.text = user?.phone
        LblBirth.text = user?.dateOfBirth
        LblContinente.text=user?.location.country
        LblCity.text = user?.location.city
    }
}

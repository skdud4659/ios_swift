//
//  ViewController.swift
//  TabelView
//
//  Created by Nayeong Kim on 2022/12/08.
//

import UIKit

// tableview 사용 시 UITableViewDataSource 프로토콜 채택 > 코드를 깔끔하게 관리하기 위해 프로토콜은 extension으로 확장해서 사용.
class ViewController: UIViewController {
    
    var movieDataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableview의 datasource 할당 > delegate와 동일하게 작동하기 때문에 형식은 동일
        tableView.dataSource = self
        // 🌟🌟🌟🌟🌟 대리자 설정 잊지말기,,,
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    // UITableViewDataSource로 인한 필수 메소드 1.
    // numberOfRows return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return movieDataManager.getMovieData().count
    }
    // UITableViewDataSource로 인한 필수 메소드 2.
    // table 안에 들어가는 cell의 형태 return
    // indexPath > row: 행 idx / section: 테이블 뷰를 그룹으로 만들었을 때 그룹의 idx
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        // 프로토타입으로 만들어둔 cell 사용
        // 스토리보드로 cell을 만들었을 경우 별도로 cell을 등록하지 않아도 괜찮으나 코드로 만들었을 경우 viewDidLoad에서 cell 등록해야함.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let array = movieDataManager.getMovieData()
        let movie = array[indexPath.row]
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        cell.selectionStyle = .none
        return cell
    }
}

// TableView 위에서 일어나는 이벤트들에 의한 일처리는 delegate 패턴을 채택하여 구현
extension ViewController: UITableViewDelegate {
    // TableView의 cell에 터치가 일어났을 때 호출되는 메소드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 스토리보드에서 간접 세그웨이로 연결했을 경우
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let array = movieDataManager.getMovieData()
            let IndexPath = sender as! IndexPath
            detailVC.movieData = array[IndexPath.row]
        }
    }
}


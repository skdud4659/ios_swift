//
//  ViewController.swift
//  TabelView
//
//  Created by Nayeong Kim on 2022/12/08.
//

import UIKit

// tableview 사용 시 UITableViewDataSource 프로토콜 채택
class ViewController: UIViewController, UITableViewDataSource {
    
    var moviesArray: [Movie] = []
    
    var movieDataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableview의 datasource 할당 > delegate와 동일하게 작동하기 때문에 형식은 동일
        tableView.dataSource = self
        
        moviesArray = movieDataManager.getMovieData()
    }

    // UITableViewDataSource로 인한 필수 메소드 1.
    // numberOfRows return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    // UITableViewDataSource로 인한 필수 메소드 2.
    // table 안에 들어가는 cell의 형태 return
    // indexPath > row: 행 idx / section: 테이블 뷰를 그룹으로 만들었을 때 그룹의 idx
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 프로토타입으로 만들어둔 cell 사용
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        return cell
    }
    
}


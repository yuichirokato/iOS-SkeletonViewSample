//
//  ViewController.swift
//  SkeletonViewSample
//
//  Created by Takahashi Yuichiro on 2019/10/22.
//  Copyright © 2019 Takahashi Yuichiro. All rights reserved.
//

import SkeletonView
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var skeletonToggleButton: UIButton!
    @IBOutlet weak var headerContainerView: UIView!
    @IBOutlet weak var userIconImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    private var nowShowSkeleton = true

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "SampleTableViewCell", bundle: nil), forCellReuseIdentifier: "SampleTableViewCell")

        setupSkeleton()

        view.showAnimatedSkeleton()
    }

    private func setupSkeleton() {
        view.isSkeletonable = true

        headerContainerView.isSkeletonable = true
        userIconImageView.isSkeletonable = true
        userNameLabel.isSkeletonable = true
        captionLabel.isSkeletonable = true
        tableView.isSkeletonable = true
    }

    @IBAction func skeletonToggleAction(_ sender: UIButton) {
        if nowShowSkeleton {
            nowShowSkeleton.toggle()

            view.hideSkeleton()
        } else {
            nowShowSkeleton.toggle()

            view.showAnimatedSkeleton()
        }
    }
}

// TableView に対して Shimmer をかける場合は SkeletonTableViewDataSource に適合させる
extension ViewController: SkeletonTableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        // TableView に Shimmer を表示するときの Cell の Identifier を返す
        return "SampleTableViewCell"
    }

    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableView に Shimmer を表示するときの Cell の数を返す
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell")!

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // cell の高さを固定にしない場合は必ず tableView.estimatedRowHeight を設定する
        return 117
    }
}


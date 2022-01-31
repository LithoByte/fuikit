//
//  FPUICollectionViewDatasource.swift
//  fuikit
//
//  Created by Remmington Damper on 1/25/22.
//

import Foundation

@objc open class FPUICollectionViewDatasource: NSObject, UICollectionViewDataSource, UIScrollViewDelegate {
    open var onNumberOfItemsInSections: (UICollectionView, Int) -> Int = { _, _ in return 0 }
    open var onNumberOfSections: (UICollectionView) -> Int = { _ in return 0 }
    open var onCellForItemAt: (UICollectionView, IndexPath) -> UICollectionViewCell = { _, _ in return UICollectionViewCell() }
    open var onViewForSupplementaryElementOfKind: (UICollectionView, String, IndexPath) -> UICollectionReusableView = {_, _, _ in return UICollectionReusableView()}
    open var onCanMoveItemAt: (UICollectionView, IndexPath) -> Bool = { _, _ in return false }
    open var onMoveItemAtToDestination: (UICollectionView, IndexPath, IndexPath) -> Void = {_, _, _ in }
    open var onIndexTitlesFor: ((UICollectionView) -> [String]?)? = {_ in return [String]() }
    open var onIndexPathForIndexTitle: (UICollectionView, String, Int) -> IndexPath = {_, _, _ in return IndexPath()}
    // -MARK: ScrollView Methods Added
    public var onScrollViewDidScroll: (UIScrollView) -> Void = { _ in }
    public var onScrollViewWillBeginDragging: (UIScrollView) -> Void = { _ in }
    public var onScrollViewWillEndDragging: (UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>) -> Void = { _, _, _ in }
    public var onScrollViewDidEndDragging: (UIScrollView, Bool) -> Void = { _, _ in}
    public var onScrollViewShouldScrollToTop: (UIScrollView) -> Bool = { _ in return true }
    public var onScrollViewDidScrollToTop: (UIScrollView) -> Void = { _ in }
    public var onScrollViewWillBeginDecelerating: (UIScrollView) -> Void = { _ in }
    public var onScrollViewDidEndDecelerating: (UIScrollView) -> Void = { _ in }
    public var onViewForZooming: (UIScrollView) -> UIView? = { _ in return nil}
    public var onScrollViewWillBeginZooming: (UIScrollView, UIView?) -> Void = { _, _ in }
    public var onScrollViewDidEndZooming: (UIScrollView, UIView?, CGFloat) -> Void = { _, _, _ in }
    public var onScrollViewDidZoom: (UIScrollView) -> Void = { _ in }
    public var onScrollViewDidEndScrollingAnimation: (UIScrollView) -> Void = { _ in }
    public var onScrollViewDidChangeAdjustedContentInset: (UIScrollView) -> Void = { _ in }

    
    public init(
        onNumberOfItemsInSections: @escaping (UICollectionView, Int) -> Int = { _, _ in return 0},
        onNumberOfSections: @escaping (UICollectionView) -> Int = { _ in return 0},
        onCellForItemAt: @escaping (UICollectionView, IndexPath) -> UICollectionViewCell = { _, _ in return UICollectionViewCell()},
        onViewForSupplementaryElementOfKind: @escaping (UICollectionView, String, IndexPath) -> UICollectionReusableView = {_, _, _ in return UICollectionReusableView()},
        onCanMoveItemAt: @escaping (UICollectionView, IndexPath) -> Bool = {_, _ in return false },
        onMoveItemAtToDestination: @escaping (UICollectionView, IndexPath, IndexPath) -> Void = { _, _, _ in},
        onIndexTitlesFor: ((UICollectionView) -> [String]?)? = { _ in [String]() },
        onIndexPathForIndexTitle: @escaping (UICollectionView, String, Int) -> IndexPath = {_, _, _ in return IndexPath() },
        //-MARK: ScrollView Initializer Methods
            onScrollViewDidScroll: @escaping (UIScrollView) -> Void = { _ in },
            onScrollViewWillBeginDragging: @escaping (UIScrollView) -> Void = { _ in },
            onScrollViewWillEndDragging: @escaping (UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>) -> Void = { _, _, _ in },
            onScrollViewDidEndDragging: @escaping (UIScrollView, Bool) -> Void = { _, _ in },
            onScrollViewShouldScrollToTop: @escaping (UIScrollView) -> Bool = {_ in return true },
            onScrollViewDidScrollToTop: @escaping (UIScrollView) -> Void = { _ in },
            onScrollViewWillBeginDecelerating: @escaping (UIScrollView) -> Void = { _ in },
            onScrollViewDidEndDecelerating: @escaping (UIScrollView) -> Void = { _ in },
            onViewForZooming: @escaping (UIScrollView) -> UIView? = {_ in return nil},
            onScrollViewWillBeginZooming: @escaping (UIScrollView, UIView?) -> Void = { _, _ in },
            onScrollViewDidEndZooming: @escaping (UIScrollView, UIView?, CGFloat) -> Void = { _, _, _ in },
            onScrollViewDidZoom: @escaping (UIScrollView) -> Void = { _ in },
            onScrollViewDidEndScrollingAnimation: @escaping (UIScrollView) -> Void = { _ in },
            onScrollViewDidChangeAdjustedContentInset: @escaping (UIScrollView) -> Void = { _ in }
    ){
        self.onNumberOfItemsInSections = onNumberOfItemsInSections
        self.onNumberOfSections = onNumberOfSections
        self.onCellForItemAt = onCellForItemAt
        self.onViewForSupplementaryElementOfKind = onViewForSupplementaryElementOfKind
        self.onCanMoveItemAt = onCanMoveItemAt
        self.onMoveItemAtToDestination = onMoveItemAtToDestination
        self.onIndexTitlesFor = onIndexTitlesFor
        self.onIndexPathForIndexTitle = onIndexPathForIndexTitle
        //-MARK: ScrollView Initialization
        self.onScrollViewDidScroll = onScrollViewDidScroll
        self.onScrollViewWillBeginDragging = onScrollViewWillBeginDragging
        self.onScrollViewWillEndDragging = onScrollViewWillEndDragging
        self.onScrollViewDidEndDragging = onScrollViewDidEndDragging
        self.onScrollViewShouldScrollToTop = onScrollViewShouldScrollToTop
        self.onScrollViewDidScrollToTop = onScrollViewDidScrollToTop
        self.onScrollViewWillBeginDecelerating = onScrollViewWillBeginDecelerating
        self.onScrollViewDidEndDecelerating = onScrollViewDidEndDecelerating
        self.onViewForZooming = onViewForZooming
        self.onScrollViewWillBeginZooming = onScrollViewWillBeginZooming
        self.onScrollViewDidEndZooming = onScrollViewDidEndZooming
        self.onScrollViewDidZoom = onScrollViewDidZoom
        self.onScrollViewDidEndScrollingAnimation = onScrollViewDidEndScrollingAnimation
        self.onScrollViewDidChangeAdjustedContentInset = onScrollViewDidChangeAdjustedContentInset
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onNumberOfItemsInSections(collectionView, section)
    }
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        onNumberOfSections(collectionView)
    }
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        onCellForItemAt(collectionView, indexPath)
    }
    open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        onViewForSupplementaryElementOfKind(collectionView, kind, indexPath)
    }
    open func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        onCanMoveItemAt(collectionView, indexPath)
    }
    open func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        onMoveItemAtToDestination(collectionView, sourceIndexPath, destinationIndexPath)
    }
    open func indexTitles(for collectionView: UICollectionView) -> [String]? {
        onIndexTitlesFor?(collectionView)
    }
    open func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        onIndexPathForIndexTitle(collectionView, title, index)
    }
    // -MARK: ScrollView Delegate Methods Added
       
       @objc open func scrollViewDidScroll(_ scrollView: UIScrollView) {
           onScrollViewDidScroll(scrollView)
       }
       @objc open func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
           onScrollViewWillBeginDragging(scrollView)
       }
       @objc open func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
           onScrollViewWillEndDragging(scrollView, velocity, targetContentOffset)
       }
       @objc open func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
           onScrollViewDidEndDragging(scrollView, decelerate)
       }
       @objc open func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool
       {
           onScrollViewShouldScrollToTop(scrollView)
       }
       @objc open func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
           onScrollViewDidScrollToTop(scrollView)
       }
       @objc open func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
           onScrollViewWillBeginDecelerating(scrollView)
       }
       @objc open func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           onScrollViewDidEndDecelerating(scrollView)
       }
       @objc open func viewForZooming(in scrollView: UIScrollView) -> UIView? {
           onViewForZooming(scrollView)
       }
       @objc open func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
           onScrollViewWillBeginZooming(scrollView, view)
       }
       @objc open func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
           onScrollViewDidEndZooming(scrollView, view, scale)
       }
       @objc open func scrollViewDidZoom(_ scrollView: UIScrollView) {
           onScrollViewDidZoom(scrollView)
       }
       @objc open func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
           onScrollViewDidEndScrollingAnimation(scrollView)
       }
       @objc open func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
           onScrollViewDidChangeAdjustedContentInset(scrollView)
       }
}

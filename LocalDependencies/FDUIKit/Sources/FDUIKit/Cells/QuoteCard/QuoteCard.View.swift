//
//  QuoteCard.View.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import FDStyle
import UIKit

/// View для экрана
extension QuoteCard {
  public final class View: UIView {
    
    // MARK: - Private properties
    
    private let mainHorizontalStackView: UIStackView = {
      let stackView = UIStackView()
      stackView.axis = .horizontal
      return stackView
    }()
    
    private let firstLineHorizontalStackView: UIStackView = {
      let stackView = UIStackView()
      stackView.axis = .horizontal
      return stackView
    }()
    private let secondLineHorizontalStackView: UIStackView = {
      let stackView = UIStackView()
      stackView.axis = .horizontal
      return stackView
    }()
    private let mainVerticalStackView: UIStackView = {
      let stackView = UIStackView()
      stackView.axis = .vertical
      return stackView
    }()
    
    private let rightSideImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFit
      imageView.image = UIImage(
        named: FDUIKitAsset.chevronRight.name,
        in: FDUIKitResources.bundle,
        compatibleWith: nil
      )?.withRenderingMode(.alwaysTemplate)
      imageView.tintColor = FDStyleAsset.constantSlate.color
      return imageView
    }()
    
    private let leftSideImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFit
      return imageView
    }()
    private let leftSideTitleLabel: UILabel = {
      let label = UILabel()
      label.font = .fancy.text.regularMedium
      label.textColor = FDStyleAsset.constantNavy.color
      return label
    }()
    private let rightSideTitleLabel: LabelGradientView = {
      let label = LabelGradientView()
      label
      return label
    }()
    
    private let leftSideDescriptionLabel: UILabel = {
      let label = UILabel()
      label.font = .fancy.text.small
      label.textColor = FDStyleAsset.constantSlate.color
      return label
    }()
    private let rightSideDescriptionLabel: UILabel = {
      let label = UILabel()
      label.font = .fancy.text.small
      label.textColor = FDStyleAsset.constantNavy.color
      return label
    }()
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
      super.init(frame: frame)
      
      configureLayout()
      applyDefaultBehavior()
    }
    
    public required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public funcs
    
    /// Конфигурация вьюшки `QuoteCard`.
    /// - Parameters:
    ///   - leftSideImage: Изображение слевой стороны карточки.
    ///   - leftSideTitle: Заголовок слевой стороны карточки.
    ///   - leftSideDescription: Описание слевой стороны карточки.
    ///   - rightSideTitle: Заголовок правой стороны карточки.
    ///   - rightSideTitleStyle: Стиль заголовка правой стороны карточки.
    ///   - rightSideDescription: Описание правой стороны карточки.
    public func configure(
      leftSideImage: UIImage?,
      leftSideTitle: String,
      leftSideDescription: String,
      rightSideTitle: String,
      rightSideTitleStyle: QuoteCard.Style,
      rightSideDescription: String
    ) {
      leftSideImageView.image = leftSideImage
      leftSideImageView.isHidden = leftSideImage == nil
      
      leftSideTitleLabel.text = leftSideTitle
      leftSideDescriptionLabel.text = leftSideDescription
      rightSideDescriptionLabel.text = rightSideDescription
      
      rightSideTitleLabel.configureWith(
        titleText: rightSideTitle,
        font: .fancy.text.regularMedium,
        textColor: rightSideTitleStyle.textColor,
        gradientDVLabel: [
          rightSideTitleStyle.backgroundBubbleColor,
          rightSideTitleStyle.backgroundBubbleColor
        ]
      )
    }
  }
}

// MARK: - Private

private extension QuoteCard.View {
  func configureLayout() {
    [firstLineHorizontalStackView, secondLineHorizontalStackView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      mainVerticalStackView.addArrangedSubview($0)
    }
    [mainVerticalStackView, rightSideImageView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      mainHorizontalStackView.addArrangedSubview($0)
    }
    [leftSideImageView, leftSideTitleLabel, UIView(), rightSideTitleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      firstLineHorizontalStackView.addArrangedSubview($0)
    }
    [leftSideDescriptionLabel, UIView(), rightSideDescriptionLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      secondLineHorizontalStackView.addArrangedSubview($0)
    }
    [mainHorizontalStackView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      mainHorizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .s4),
      mainHorizontalStackView.topAnchor.constraint(equalTo: topAnchor, constant: .s2),
      mainHorizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.s2),
      mainHorizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.s2),
      
      leftSideImageView.widthAnchor.constraint(equalToConstant: .s6),
      leftSideImageView.heightAnchor.constraint(equalToConstant: .s6),
      rightSideImageView.heightAnchor.constraint(equalToConstant: .s4),
      rightSideImageView.widthAnchor.constraint(equalToConstant: .s4),
      rightSideTitleLabel.trailingAnchor.constraint(equalTo: rightSideImageView.leadingAnchor, constant: -.s1),
      secondLineHorizontalStackView.trailingAnchor.constraint(equalTo: rightSideImageView.leadingAnchor, constant: -.s2),
      heightAnchor.constraint(equalToConstant: .s17)
    ])
  }
  
  func applyDefaultBehavior() {
    backgroundColor = FDStyleAsset.constantGhost.color
  }
}

// MARK: - Appearance

private extension QuoteCard.View {
  struct Appearance {}
}

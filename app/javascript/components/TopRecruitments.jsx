import React from "react";

const truncateText = (text, maxLength) => {
  return text.length > maxLength ? `${text.slice(0, maxLength)}...` : text;
};

const TopRecruitments = (props) => {
  const { scraped_recruitments } = props;

  return (
    <div className="c-recruitment_lists">
      {scraped_recruitments.length > 0 ? (
        scraped_recruitments.map((scraped_recruitment) => (
          <div
            className="c-recruitment_lists__container"
            key={scraped_recruitment.id}
          >
            <h2 className="c-recruitment_lists__title">
              {truncateText(scraped_recruitment.title, 50)}
            </h2>
            <span className="c-recruitment_lists__deadline">
              締切日：{new Date(scraped_recruitment.deadline).toLocaleString()}
            </span>
            {/* Uncomment the next line if HTML rendering is required */}
            {/* <p className="description" dangerouslySetInnerHTML={{ __html: scraped_recruitment.description }}></p> */}
            <dl className="c-recruitment_lists__organization">
              <dt className="c-recruitment_lists__organization__title">
                団体名
              </dt>
              <dd className="c-recruitment_lists__organization__content">
                {scraped_recruitment.organization_name}
              </dd>
            </dl>
            <a href="/" className="c-button">
              募集の詳細を見る
            </a>
          </div>
        ))
      ) : (
        <p className="desc">現在、求人情報はありません。</p>
      )}
    </div>
  );
};

export default TopRecruitments;

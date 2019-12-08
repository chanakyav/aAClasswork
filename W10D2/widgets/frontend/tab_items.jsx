import React from 'react';

const TabItems = ({items}) => {
  console.log(items);
  
  return (
    <div>
      <ul>
        {items.map( (tab, i) => <li key={i}><h3>{tab.title}</h3></li>)}
      </ul>
      <article>{}</article>
    </div>
  );
};

export default TabItems;
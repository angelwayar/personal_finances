String? imgValidator(String img) {
  const imgExists = {
    'card1.jpg',
    'card2.jpg',
    'card3.jpg',
    'card4.jpg',
    'card5.jpg',
    'card6.jpg',
    'card7.jpg',
  };

  return imgExists.contains(img) ? img : null;
}

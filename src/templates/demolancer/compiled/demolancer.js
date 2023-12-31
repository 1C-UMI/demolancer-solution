var site = {};

/**
 * Основной модуль шаблона
 * @type {{init: site.common.init}}
 */
site.common = {

	/** Инициализирует стили и поведение на всех страницах сайта */
	init: function() {}
};

$(function() {
	site.common.init();
});

/**
 * Модуль кнопок социальных сетей
 * @type {{open: (function(*): boolean)}}
 */
site.socialButtons = {

	/**
	 * Открывает окно с возможностью поделиться страницей в выбранной социальной сети
	 * @param {String} name имя социальной сети
	 * @returns {Boolean}
	 */
	open: function(name) {
		var title = encodeURIComponent(document.title);
		var url = encodeURIComponent(location.href);
		var href = '';

		switch (name) {
			case 'social_vk': {
				href = 'https://vkontakte.ru/share.php?url=' + url;
				break;
			}
			case 'social_odnoklassniki': {
				href = 'https://connect.ok.ru/offer?url=' + url + '&title=' + title;
				break;
			}
			case 'social_mir': {
				href = 'https://connect.mail.ru/share?url=' + url + '&title=' + title;
				break;
			}
			case 'social_twitter': {
				href = 'https://twitter.com/home?status=' + title + '+' + url;
				break;
			}
			case 'social_livejournal': {
				href = 'https://www.livejournal.com/update.bml?event=' + url + '&subject=' + title;
				break;
			}
		}
		window.open(href, '_blank', 'width=640, height=480');
		return false;
	}
};
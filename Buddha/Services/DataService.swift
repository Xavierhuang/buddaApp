//
//  DataService.swift
//  Buddha
//
//  Created by Weijia Huang on 12/14/25.
//

import Foundation
import SwiftData

// MARK: - DataService
class DataService {
    // MARK: - Load Sample Data
    static func loadSampleData(context: ModelContext) {
        // Check if data already exists
        let descriptor = FetchDescriptor<BuddhistText>()
        let existingTexts = (try? context.fetch(descriptor)) ?? []
        
        // Check which texts already exist
        let existingTitles = Set(existingTexts.map { $0.title })
        
        // Only load texts that don't exist yet
        let shouldLoadHeartSutra = !existingTitles.contains("Heart Sutra") && !existingTitles.contains("Heart Sutra (心經)")
        let shouldLoadDiamondSutra = !existingTitles.contains("Diamond Sutra")
        let shouldLoadFourNobleTruths = !existingTitles.contains("The Four Noble Truths")
        let shouldLoadEightfoldPath = !existingTitles.contains("The Noble Eightfold Path")
        let shouldLoadWaterRepentance = !existingTitles.contains("Samadhi Water Repentance")
        
        // If all texts exist, return early
        if !shouldLoadHeartSutra && !shouldLoadDiamondSutra && !shouldLoadFourNobleTruths && !shouldLoadEightfoldPath && !shouldLoadWaterRepentance {
            return
        }
        
        // MARK: - Heart Sutra
        if shouldLoadHeartSutra {
        let heartSutra = BuddhistText(
            title: "Heart Sutra (心經)",
            author: "Buddha",
            textDescription: "The Heart of Perfect Wisdom Sutra",
            category: "Sutra"
        )
        
        let heartChapter1 = Chapter(number: 1, title: "The Heart of Perfect Wisdom")
        heartChapter1.text = heartSutra
        heartChapter1.verses = [
            Verse(
                number: 1,
                text: "Avalokiteshvara, the Bodhisattva of Compassion, meditating deeply on Perfection of Wisdom, saw clearly that the five aspects of human existence are empty, and so released himself from suffering.",
                pinyin: "guān zì zài pú sà, xíng shēn bō rě bō luó mì duō shí, zhào jiàn wǔ yùn jiē kōng, dù yí qiè kǔ è",
                chinese: "觀自在菩薩，行深般若波羅蜜多時，照見五蘊皆空，度一切苦厄"
            ),
            Verse(
                number: 2,
                text: "Answering the monk Sariputra, he said this:",
                pinyin: "shè lì zǐ",
                chinese: "舍利子"
            ),
            Verse(
                number: 3,
                text: "Body is nothing more than emptiness, emptiness is nothing more than body. The body is exactly empty, and emptiness is exactly body.",
                pinyin: "sè bú yì kōng, kōng bú yì sè, sè jí shì kōng, kōng jí shì sè",
                chinese: "色不異空，空不異色，色即是空，空即是色"
            ),
            Verse(
                number: 4,
                text: "The other four aspects of human existence — feeling, thought, will, and consciousness — are likewise nothing more than emptiness, and emptiness nothing more than they.",
                pinyin: "shòu xiǎng xíng shí, yì fù rú shì",
                chinese: "受想行識，亦復如是"
            ),
            Verse(
                number: 5,
                text: "All things are empty: Nothing is born, nothing dies, nothing is pure, nothing is stained, nothing increases and nothing decreases.",
                pinyin: "shè lì zǐ, shì zhū fǎ kōng xiàng, bù shēng bù miè, bù gòu bù jìng, bù zēng bù jiǎn",
                chinese: "舍利子，是諸法空相，不生不滅，不垢不淨，不增不減"
            ),
            Verse(
                number: 6,
                text: "So, in emptiness, there is no body, no feeling, no thought, no will, no consciousness.",
                pinyin: "shì gù kōng zhōng wú sè, wú shòu xiǎng xíng shí",
                chinese: "是故空中無色，無受想行識"
            ),
            Verse(
                number: 7,
                text: "There are no eyes, no ears, no nose, no tongue, no body, no mind. There is no seeing, no hearing, no smelling, no tasting, no touching, no imagining.",
                pinyin: "wú yǎn ěr bí shé shēn yì, wú sè shēng xiāng wèi chù fǎ",
                chinese: "無眼耳鼻舌身意，無色聲香味觸法"
            ),
            Verse(
                number: 8,
                text: "There is nothing seen, nor heard, nor smelled, nor tasted, nor touched, nor imagined.",
                pinyin: "wú yǎn jiè, nǎi zhì wú yì shí jiè",
                chinese: "無眼界，乃至無意識界"
            ),
            Verse(
                number: 9,
                text: "There is no ignorance, and no end to ignorance. There is no old age and death, and no end to old age and death.",
                pinyin: "wú wú míng, yì wú wú míng jìn, nǎi zhì wú lǎo sǐ, yì wú lǎo sǐ jìn",
                chinese: "無無明，亦無無明盡，乃至無老死，亦無老死盡"
            ),
            Verse(
                number: 10,
                text: "There is no suffering, no cause of suffering, no end to suffering, no path to follow.",
                pinyin: "wú kǔ jí miè dào",
                chinese: "無苦集滅道"
            ),
            Verse(
                number: 11,
                text: "There is no attainment of wisdom, and no wisdom to attain.",
                pinyin: "wú zhì yì wú dé",
                chinese: "無智亦無得"
            ),
            Verse(
                number: 12,
                text: "The Bodhisattvas rely on the Perfection of Wisdom, and so with no delusions, they feel no fear, and have Nirvana here and now.",
                pinyin: "yǐ wú suǒ dé gù, pú tí sà duǒ, yī bō rě bō luó mì duō gù, xīn wú guà ài, wú guà ài gù, wú yǒu kǒng bù, yuǎn lí diān dǎo mèng xiǎng, jiū jìng niè pán",
                chinese: "以無所得故，菩提薩埵，依般若波羅蜜多故，心無罣礙，無罣礙故，無有恐怖，遠離顛倒夢想，究竟涅槃"
            ),
            Verse(
                number: 13,
                text: "All the Buddhas, past, present, and future, rely on the Perfection of Wisdom, and live in full enlightenment.",
                pinyin: "sān shì zhū fó, yī bō rě bō luó mì duō gù, dé ā nòu duō luó sān miǎo sān pú tí",
                chinese: "三世諸佛，依般若波羅蜜多故，得阿耨多羅三藐三菩提"
            ),
            Verse(
                number: 14,
                text: "The Perfection of Wisdom is the greatest mantra. It is the clearest mantra, the highest mantra, the mantra that removes all suffering.",
                pinyin: "gù zhī bō rě bō luó mì duō, shì dà shén zhòu, shì dà míng zhòu, shì wú shàng zhòu, shì wú děng děng zhòu, néng chú yí qiè kǔ, zhēn shí bù xū",
                chinese: "故知般若波羅蜜多，是大神咒，是大明咒，是無上咒，是無等等咒，能除一切苦，真實不虛"
            ),
            Verse(
                number: 15,
                text: "This is truth that cannot be doubted. Say it so: Gate, gate, paragate, parasamgate, bodhi svaha! (Gone, gone, gone beyond, gone completely beyond, enlightenment, hail!)",
                pinyin: "gù shuō bō rě bō luó mì duō zhòu, jí shuō zhòu yuē: jiē dì jiē dì, bō luó jiē dì, bō luó sēng jiē dì, pú tí sà pó hē",
                chinese: "故說般若波羅蜜多咒，即說咒曰：揭諦揭諦，波羅揭諦，波羅僧揭諦，菩提薩婆訶"
            )
        ]
        for verse in heartChapter1.verses {
            verse.chapter = heartChapter1
        }
        heartSutra.chapters.append(heartChapter1)
        context.insert(heartSutra)
        }
        
        // MARK: - Diamond Sutra
        if shouldLoadDiamondSutra {
        let diamondSutra = BuddhistText(
            title: "Diamond Sutra (金剛般若波羅蜜經)",
            author: "Buddha",
            textDescription: "The Diamond Cutter Sutra",
            category: "Sutra"
        )
        
        // MARK: Diamond Sutra - Chapter 1: The Setting
        let diamondChapter1 = Chapter(number: 1, title: "The Setting")
        diamondChapter1.text = diamondSutra
        diamondChapter1.verses = [
            Verse(
                number: 1,
                text: "Thus have I heard. Once the Buddha was staying in the monastery in Anathapindika's garden in the Jeta Grove near Shravasti with a community of 1,250 bhikkhus, fully ordained monks.",
                pinyin: "rú shì wǒ wén: yī shí fó zài shè wèi guó qí shù jǐ gū dú yuán, yǔ dà bǐ qiū zhòng qiān bǎi wǔ shí rén jù",
                chinese: "如是我聞：一時佛在舍衛國祇樹給孤獨園，與大比丘眾千二百五十人俱"
            ),
            Verse(
                number: 2,
                text: "That day, as evening approached, the Buddha put on his patched robe and, carrying his bowl, entered the capital of Shravasti to seek offerings of food.",
                pinyin: "ěr shí shì zūn shí shí, zhuó yī chí bō, rù shè wèi dà chéng qǐ shí",
                chinese: "爾時世尊食時，著衣持缽，入舍衛大城乞食"
            ),
            Verse(
                number: 3,
                text: "After going from house to house and receiving offerings, he returned to the Jeta Grove. When he had finished his meal, he put away his bowl and robe, bathed his feet, and sat with his legs crossed and his body upright upon the seat arranged for him, mindfully fixing his attention in front of him.",
                pinyin: "yú qí chéng zhōng cì dì qǐ yǐ, hái zhì běn chù. fàn shí qì, shōu yī bō, xǐ zú yǐ, fū zuò ér zuò",
                chinese: "於其城中次第乞已，還至本處。飯食訖，收衣缽，洗足已，敷座而坐"
            )
        ]
        for verse in diamondChapter1.verses {
            verse.chapter = diamondChapter1
        }
        
        // MARK: Diamond Sutra - Chapter 2: Subhuti's Request
        let diamondChapter2 = Chapter(number: 2, title: "Subhuti's Request")
        diamondChapter2.text = diamondSutra
        diamondChapter2.verses = [
            Verse(
                number: 1,
                text: "At that time the elder Subhuti came forth from the assembly, bared his right shoulder, knelt upon his right knee, and, raising his hands with palms joined, respectfully addressed the Buddha:",
                pinyin: "shí zhǎng lǎo xū pú tí zài dà zhòng zhōng, jí cóng zuò qǐ, piān tǎn yòu jiān, yòu xī zhe dì, hé zhǎng gōng jìng ér bái fó yán",
                chinese: "時長老須菩提在大眾中，即從座起，偏袒右肩，右膝著地，合掌恭敬而白佛言"
            ),
            Verse(
                number: 2,
                text: "World-Honored One, it is rare how well the Tathagata teaches the bodhisattvas how to care for their minds.",
                pinyin: "xī yǒu shì zūn! rú lái shàn hù niàn zhū pú sà, shàn fù zhǔ zhū pú sà",
                chinese: "希有世尊！如來善護念諸菩薩，善付囑諸菩薩"
            ),
            Verse(
                number: 3,
                text: "World-Honored One, how should those who set forth on the bodhisattva path maintain their awareness, and how should they control their thoughts?",
                pinyin: "shì zūn! shàn nán zǐ shàn nǚ rén fā ā nòu duō luó sān miǎo sān pú tí xīn, yīng yún hé zhù? yún hé xiáng fú qí xīn?",
                chinese: "世尊！善男子善女人發阿耨多羅三藐三菩提心，應云何住？云何降伏其心？"
            )
        ]
        for verse in diamondChapter2.verses {
            verse.chapter = diamondChapter2
        }
        
        // MARK: Diamond Sutra - Chapter 3: The First Teaching
        let diamondChapter3 = Chapter(number: 3, title: "The First Teaching")
        diamondChapter3.text = diamondSutra
        diamondChapter3.verses = [
            Verse(
                number: 1,
                text: "The Buddha said: 'Subhuti, those who would now set forth on the bodhisattva path should thus give birth to this thought:'",
                pinyin: "fó gào xū pú tí: zhū pú sà mó hē sà yīng rú shì xiáng fú qí xīn",
                chinese: "佛告須菩提：諸菩薩摩訶薩應如是降伏其心"
            ),
            Verse(
                number: 2,
                text: "'However many beings there are in whatever realms of being might exist, whether they are born from an egg or from a womb, from water or from air, whether they have form or no form, whether they have perception or no perception or neither perception nor no perception, I must lead them to the shore of liberation.'",
                pinyin: "suǒ yǒu yī qiè zhòng shēng zhī lèi, ruò luǎn shēng, ruò tāi shēng, ruò shī shēng, ruò huà shēng; ruò yǒu sè, ruò wú sè; ruò yǒu xiǎng, ruò wú xiǎng, ruò fēi yǒu xiǎng fēi wú xiǎng, wǒ jiē lìng rù wú yú niè pán ér miè dù zhī",
                chinese: "所有一切眾生之類，若卵生、若胎生、若濕生、若化生；若有色、若無色；若有想、若無想、若非有想非無想，我皆令入無餘涅槃而滅度之"
            ),
            Verse(
                number: 3,
                text: "But after this innumerable, immeasurable, infinite number of beings has been liberated, in truth no being has been liberated. Why is this, Subhuti? It is because no bodhisattva who is a true bodhisattva cherishes the idea of an ego-entity, a personality, a being, or a separated individuality.",
                pinyin: "rú shì miè dù wú liàng wú shù wú biān zhòng shēng, shí wú zhòng shēng dé miè dù zhě. hé yǐ gù? xū pú tí! ruò pú sà yǒu wǒ xiàng, rén xiàng, zhòng shēng xiàng, shòu zhě xiàng, jí fēi pú sà",
                chinese: "如是滅度無量無數無邊眾生，實無眾生得滅度者。何以故？須菩提！若菩薩有我相、人相、眾生相、壽者相，即非菩薩"
            )
        ]
        for verse in diamondChapter3.verses {
            verse.chapter = diamondChapter3
        }
        
        // MARK: Diamond Sutra - Chapter 4: The Wonder of Behaving Without Attachment
        let diamondChapter4 = Chapter(number: 4, title: "The Wonder of Behaving Without Attachment")
        diamondChapter4.text = diamondSutra
        diamondChapter4.verses = [
            Verse(
                number: 1,
                text: "Moreover, Subhuti, within this phenomenal world, a bodhisattva should practice giving without abiding in anything. This means that he should not give while abiding in form, nor should he give while abiding in sound, smell, taste, touch, or dharmas. Subhuti, a bodhisattva should not give while abiding in any notion whatsoever. And why is this? If a bodhisattva gives without abiding in any notion whatsoever, then his merit will be immeasurable.",
                pinyin: "fù cì: xū pú tí! pú sà yú fǎ yīng wú suǒ zhù xíng yú bù shī. suǒ wèi bù zhù sè bù shī, bù zhù shēng, xiāng, wèi, chù, fǎ bù shī. xū pú tí! pú sà yīng rú shì bù shī, bù zhù yú xiàng. hé yǐ gù? ruò pú sà bù zhù xiàng bù shī, qí fú dé bù kě sī liàng",
                chinese: "復次：須菩提！菩薩於法應無所住行於布施。所謂不住色布施，不住聲、香、味、觸、法布施。須菩提！菩薩應如是布施，不住於相。何以故？若菩薩不住相布施，其福德不可思量"
            ),
            Verse(
                number: 2,
                text: "Subhuti, what do you think? Can the vastness of space to the east be measured?",
                pinyin: "xū pú tí! yú yì yún hé? dōng fāng xū kōng kě sī liàng fǒu?",
                chinese: "須菩提！於意云何？東方虛空可思量不？"
            )
        ]
        for verse in diamondChapter4.verses {
            verse.chapter = diamondChapter4
        }
        
        // MARK: Diamond Sutra - Chapter 5: Seeing the Truth That Lies Beneath Perception
        let diamondChapter5 = Chapter(number: 5, title: "Seeing the Truth That Lies Beneath Perception")
        diamondChapter5.text = diamondSutra
        diamondChapter5.verses = [
            Verse(
                number: 1,
                text: "Subhuti, what do you think? Can the vastness of space to the east be measured?",
                pinyin: "xū pú tí! yú yì yún hé? dōng fāng xū kōng kě sī liàng fǒu?",
                chinese: "須菩提！於意云何？東方虛空可思量不？"
            ),
            Verse(
                number: 2,
                text: "No, it cannot, World-honored One.",
                pinyin: "fǒu yě, shì zūn!",
                chinese: "不也，世尊！"
            ),
            Verse(
                number: 3,
                text: "Subhuti, the merit of a bodhisattva who practices giving without abiding in any notion is just as immeasurable as the vastness of space in all directions.",
                pinyin: "xū pú tí, nán xī běi sì wéi shàng xià xū kōng kě sī liàng fǒu? fǒu yě, shì zūn! xū pú tí! pú sà wú zhù xiàng bù shī, fú dé yì fù rú shì bù kě sī liàng",
                chinese: "須菩提，南西北方四維上下虛空可思量不？不也，世尊！須菩提！菩薩無住相布施，福德亦復如是不可思量"
            )
        ]
        for verse in diamondChapter5.verses {
            verse.chapter = diamondChapter5
        }
        
        // MARK: Diamond Sutra - Chapter 6: The Rarity of True Belief
        let diamondChapter6 = Chapter(number: 6, title: "The Rarity of True Belief")
        diamondChapter6.text = diamondSutra
        diamondChapter6.verses = [
            Verse(
                number: 1,
                text: "No, World-honored One, no one can see the Tathagata from his physical form. And why is this? The Tathagata has said that physical form is not physical form.",
                pinyin: "yǐ shēn xiàng jiàn rú lái fǒu? fǒu yě, shì zūn! bù kě yǐ shēn xiàng dé jiàn rú lái. hé yǐ gù? rú lái suǒ shuō shēn xiàng, jí fēi shēn xiàng",
                chinese: "以身相見如來不？」「不也，世尊！不可以身相得見如來。何以故？如來所說身相，即非身相"
            ),
            Verse(
                number: 2,
                text: "The Buddha said to Subhuti, \"All forms are illusory. If you see that all forms are not forms, then you see the Tathagata.\"",
                pinyin: "fó gào xū pú tí: fán suǒ yǒu xiàng, jiē shì xū wàng. ruò jiàn zhū xiàng fēi xiàng, jí jiàn rú lái",
                chinese: "佛告須菩提：凡所有相，皆是虛妄。若見諸相非相，即見如來"
            ),
            Verse(
                number: 3,
                text: "Subhuti said to the Buddha, \"World-honored One, can sentient beings, upon hearing these words, truly believe them?\"",
                pinyin: "xū pú tí bái fó yán: shì zūn! pō yǒu zhòng shēng, dé wén rú shì yán shuō zhāng jù, shēng shí xìn fǒu?",
                chinese: "須菩提白佛言：世尊！頗有眾生，得聞如是言說章句，生實信不？"
            ),
            Verse(
                number: 4,
                text: "The Buddha told Subhuti, \"Do not talk like that. Even after I have entered nirvana for five hundred years, there will still be people who uphold the precepts and generate merit who will believe these words and accept them as truth. You should know that they planted good roots not just with one Buddha, or two Buddhas, or three, or four, or five Buddhas, but that they planted good roots with infinite tens of millions of Buddhas. For a person who has one thought of pure belief, Subhuti, the Tathagata fully knows and fully sees that those sentient beings will attain such limitless merit.\"",
                pinyin: "fó gào xū pú tí: mò zuò shì shuō! rú lái miè hòu, hòu wǔ bǎi suì, yǒu chí jiè xiū fú zhě, yú cǐ zhāng jù, néng shēng xìn xīn, yǐ cǐ wéi shí. dāng zhī shì rén, bù yú yī fó, èr fó, sān sì wǔ fó ér zhòng shàn gēn, yǐ yú wú liàng qiān wàn fó suǒ zhòng zhū shàn gēn. wén shì zhāng jù, nǎi zhì yī niàn shēng jìng xìn zhě; xū pú tí! rú lái xī zhī xī jiàn, shì zhū zhòng shēng dé rú shì wú liàng fú dé",
                chinese: "佛告須菩提：莫作是說！如來滅後，後五百歲，有持戒修福者，於此章句，能生信心，以此為實。當知是人，不於一佛、二佛、三四五佛而種善根，已於無量千萬佛所種諸善根。聞是章句，乃至一念生淨信者；須菩提！如來悉知悉見，是諸眾生得如是無量福德"
            ),
            Verse(
                number: 5,
                text: "Such a person already does not have the notion of a self, the notion of others, the notion of sentient beings, the notion of longevity, the notion of phenomena, or the notion of non-phenomena. And why is this? If a sentient being clings to a notion with his mind, then he will cling to self, others, sentient beings, and longevity. If he clings to the notion of phenomena, then he will cling to self, others, sentient beings, and longevity. And why is this? If he clings to the notion of non-phenomena then he will cling to self, others, sentient beings, and longevity. Thus, he must not cling to phenomena or non-phenomena.",
                pinyin: "hé yǐ gù? shì zhū zhòng shēng, wú fù wǒ xiàng, rén xiàng, zhòng shēng xiàng, shòu zhě xiàng, wú fǎ xiàng, yì wú fēi fǎ xiàng. hé yǐ gù? shì zhū zhòng shēng ruò xīn qǔ xiàng, jí wéi zhuó wǒ, rén, zhòng shēng, shòu zhě. ruò qǔ fǎ xiàng, jí zhuó wǒ, rén, zhòng shēng, shòu zhě. hé yǐ gù? ruò qǔ fēi fǎ xiàng, jí zhuó wǒ, rén, zhòng shēng, shòu zhě. shì gù bù yīng qǔ fǎ, bù yīng qǔ fēi fǎ",
                chinese: "何以故？是諸眾生，無復我相、人相、眾生相、壽者相、無法相，亦無非法相。何以故？是諸眾生若心取相，即為著我、人、眾生、壽者。若取法相，即著我、人、眾生、壽者。何以故？若取非法相，即著我、人、眾生、壽者。是故不應取法，不應取非法"
            )
        ]
        for verse in diamondChapter6.verses {
            verse.chapter = diamondChapter6
        }
        
        // MARK: Diamond Sutra - Chapter 7: Nothing Has Been Attained and Nothing Has Been Said
        let diamondChapter7 = Chapter(number: 7, title: "Nothing Has Been Attained and Nothing Has Been Said")
        diamondChapter7.text = diamondSutra
        diamondChapter7.verses = [
            Verse(
                number: 1,
                text: "This is why I have often said to you, bhiksus, that even my teachings should be understood to be like a raft. If even the Dharma must be let go of, what about what is not the Dharma?",
                pinyin: "shì yì gù, rú lái cháng shuō: rǔ děng bǐ qiū, zhī wǒ shuō fǎ, rú fá yù zhě; fǎ shàng yīng shě, hé kuàng fēi fǎ?",
                chinese: "是義故，如來常說：汝等比丘，知我說法，如筏喻者；法尚應捨，何況非法？"
            ),
            Verse(
                number: 2,
                text: "Subhuti, what do you think? Has the Tathagata really attained anuttara samyaksambodhi? Has the Tathagata really spoken the Dharma?",
                pinyin: "xū pú tí! yú yì yún hé? rú lái dé ā nòu duō luó sān miǎo sān pú tí yě? rú lái yǒu suǒ shuō fǎ yě?",
                chinese: "須菩提！於意云何？如來得阿耨多羅三藐三菩提耶？如來有所說法耶？"
            ),
            Verse(
                number: 3,
                text: "Subhuti said, \"As far as I understand what the Buddha has said, there is no standard Dharma that can be called anuttara samyaksambodhi, and there is no standard Dharma spoken by the Tathagata. And why is this? The Dharma of which the Tathagata speaks cannot be held on to, it cannot be spoken, it is not a phenomenon, and it is not a non-phenomenon. Why? All saints and sages are distinguished by their different understanding of the unconditioned Dharma.\"",
                pinyin: "xū pú tí yán: rú wǒ jiě fó suǒ shuō yì, wú yǒu dìng fǎ, míng ā nòu duō luó sān miǎo sān pú tí; yì wú yǒu dìng fǎ rú lái kě shuō. hé yǐ gù? rú lái suǒ shuō fǎ, jiē bù kě qǔ, bù kě shuō; fēi fǎ, fēi fēi fǎ. suǒ yǐ zhě hé? yī qiè xián shèng, jiē yǐ wú wéi fǎ, ér yǒu chā bié",
                chinese: "須菩提言：如我解佛所說義，無有定法，名阿耨多羅三藐三菩提；亦無有定法如來可說。何以故？如來所說法，皆不可取、不可說；非法、非非法。所以者何？一切賢聖，皆以無為法，而有差別"
            )
        ]
        for verse in diamondChapter7.verses {
            verse.chapter = diamondChapter7
        }
        
        // MARK: Diamond Sutra - Chapter 8: Enlightenment Comes from These Teachings
        let diamondChapter8 = Chapter(number: 8, title: "Enlightenment Comes from These Teachings")
        diamondChapter8.text = diamondSutra
        diamondChapter8.verses = [
            Verse(
                number: 1,
                text: "Subhuti, what do you think? If someone were to fill the three thousandfold world system with the seven treasures, used them for giving, and attained merit for this, would the merit be great?",
                pinyin: "xū pú tí! yú yì yún hé? ruò rén mǎn sān qiān dà qiān shì jiè qī bǎo, yǐ yòng bù shī. shì rén suǒ dé fú dé, níng wéi duō fǒu?",
                chinese: "須菩提！於意云何？若人滿三千大千世界七寶，以用布施。是人所得福德，寧為多不？"
            ),
            Verse(
                number: 2,
                text: "Subhuti said, \"It would be very great, World-honored One. And why is this? Such merit is not the nature of merit; thus the Tathagata says it is great.\"",
                pinyin: "xū pú tí yán: shèn duō, shì zūn! hé yǐ gù? shì fú dé, jí fēi fú dé xìng. shì gù rú lái shuō fú dé duō",
                chinese: "須菩提言：甚多，世尊！何以故？是福德，即非福德性。是故如來說福德多"
            ),
            Verse(
                number: 3,
                text: "If someone else were to receive and uphold as few as four lines of verse from this sutra, and if he were to explain them to others, his merit would be even greater than that. And why is this? Subhuti, all Buddhas and all the supremely enlightened teachings of the Buddhas are born of this sutra. Subhuti, that which is called the Buddhadharma is not the Buddhadharma.",
                pinyin: "ruò fù yǒu rén, yú cǐ jīng zhōng, shòu chí nǎi zhì sì jù jì děng, wèi tā rén shuō, qí fú shèng bǐ. hé yǐ gù? xū pú tí! yī qiè zhū fó, jí zhū fó ā nòu duō luó sān miǎo sān pú tí fǎ, jiē cóng cǐ jīng chū. xū pú tí! suǒ wèi fó fǎ zhě, jí fēi fó fǎ",
                chinese: "若復有人，於此經中，受持乃至四句偈等，為他人說，其福勝彼。何以故？須菩提！一切諸佛，及諸佛阿耨多羅三藐三菩提法，皆從此經出。須菩提！所謂佛法者，即非佛法"
            )
        ]
        for verse in diamondChapter8.verses {
            verse.chapter = diamondChapter8
        }
        
        // MARK: Diamond Sutra - Chapter 9: The Manifestation of One Mark and No Mark
        let diamondChapter9 = Chapter(number: 9, title: "The Manifestation of One Mark and No Mark")
        diamondChapter9.text = diamondSutra
        diamondChapter9.verses = [
            Verse(
                number: 1,
                text: "Subhuti, what do you think? Would it be right for a srotapana to think like this: 'I have attained the fruit of srotapana'?",
                pinyin: "xū pú tí! yú yì yún hé? xū tuó huán néng zuò shì niàn, wǒ dé xū tuó huán guǒ fǒu?",
                chinese: "須菩提！於意云何？須陀洹能作是念，我得須陀洹果不？"
            ),
            Verse(
                number: 2,
                text: "Subhuti said, \"No, World-honored One. And why is this? Srotapana means 'stream-enterer', and yet there is nothing to be entered. To not enter into form, sound, smell, taste, touch, or dharmas is what is called srotapana.\"",
                pinyin: "xū pú tí yán: bù yě, shì zūn! hé yǐ gù? xū tuó huán míng wéi rù liú, ér wú suǒ rù; bù rù sè, shēng, xiāng, wèi, chù, fǎ. shì míng xū tuó huán",
                chinese: "須菩提言：不也，世尊！何以故？須陀洹名為入流，而無所入；不入色、聲、香、味、觸、法。是名須陀洹"
            ),
            Verse(
                number: 3,
                text: "Subhuti, what do you think? Would it be right for a sakradagami to think like this: 'I have attained the fruit of sakradagami?'",
                pinyin: "xū pú tí! yú yì yún hé? sī tuó hán néng zuò shì niàn, wǒ dé sī tuó hán guǒ fǒu?",
                chinese: "須菩提！於意云何？斯陀含能作是念，我得斯陀含果不？"
            ),
            Verse(
                number: 4,
                text: "Subhuti said, \"No, World-honored One. And why is this? Sakradagami means 'once-returner', and yet in truth there is no such thing as returning. This is what is called sakradagami.\"",
                pinyin: "xū pú tí yán: bù yě, shì zūn! hé yǐ gù? sī tuó hán míng yī wǎng lái, ér shí wú wǎng lái, shì míng sī tuó hán",
                chinese: "須菩提言：不也，世尊！何以故？斯陀含名一往來，而實無往來，是名斯陀含"
            ),
            Verse(
                number: 5,
                text: "Subhuti, what do you think? Would it be right for an anagami to think like this: 'I have attained the fruit of anagami?'",
                pinyin: "xū pú tí! yú yì yún hé? ā nà hán néng zuò shì niàn, wǒ dé ā nà hán guǒ fǒu?",
                chinese: "須菩提！於意云何？阿那含能作是念，我得阿那含果不？"
            ),
            Verse(
                number: 6,
                text: "Subhuti said, \"No, World-honored One. And why is this? Anagami means 'non-returner', and yet in truth there is no such thing as never returning. This is the reason it is called anagami.\"",
                pinyin: "xū pú tí yán: bù yě, shì zūn! hé yǐ gù? ā nà hán míng wéi bù lái, ér shí wú bù lái, shì gù míng ā nà hán",
                chinese: "須菩提言：不也，世尊！何以故？阿那含名為不來，而實無不來，是故名阿那含"
            ),
            Verse(
                number: 7,
                text: "Subhuti, what do you think? Would it be right for an arhat to think like this: 'I have attained the path of an arhat?'",
                pinyin: "xū pú tí! yú yì yún hé? ā luó hàn néng zuò shì niàn, wǒ dé ā luó hàn dào fǒu?",
                chinese: "須菩提！於意云何？阿羅漢能作是念，我得阿羅漢道不？"
            ),
            Verse(
                number: 8,
                text: "Subhuti said, \"No, World-honored One. And why is this? There is no standard Dharma that can be called an arhat.\"",
                pinyin: "xū pú tí yán: bù yě, shì zūn! hé yǐ gù? shí wú yǒu fǎ míng ā luó hàn",
                chinese: "須菩提言：不也，世尊！何以故？實無有法名阿羅漢"
            )
        ]
        for verse in diamondChapter9.verses {
            verse.chapter = diamondChapter9
        }
        
        // MARK: Diamond Sutra - Chapter 10: Adorning the Buddha Land
        let diamondChapter10 = Chapter(number: 10, title: "Adorning the Buddha Land")
        diamondChapter10.text = diamondSutra
        diamondChapter10.verses = [
            Verse(
                number: 1,
                text: "Subhuti, in reality, is without practice, and thus it is called delighting in the practice of calm and quiet.",
                pinyin: "xū pú tí, shí wú suǒ xíng, ér míng xū pú tí, shì lè ā lán nà xíng",
                chinese: "須菩提，實無所行，而名須菩提，是樂阿蘭那行"
            ),
            Verse(
                number: 2,
                text: "The Buddha said to Subhuti, \"What do you think? In the past, when the Tathagata was with Dipamkara Buddha, did he attain the Dharma?\"",
                pinyin: "fó gào xū pú tí: yú yì yún hé? rú lái xī zài rán dēng fó suǒ, yú fǎ yǒu suǒ dé fǒu?",
                chinese: "佛告須菩提：於意云何？如來昔在然燈佛所，於法有所得不？"
            ),
            Verse(
                number: 3,
                text: "\"No, World-honored One, when the Tathagata was with Dipamkara Buddha, he truly did not attain the Dharma.\"",
                pinyin: "fǒu yě, shì zūn! rú lái zài rán dēng fó suǒ, yú fǎ shí wú suǒ dé",
                chinese: "不也，世尊！如來在然燈佛所，於法實無所得"
            ),
            Verse(
                number: 4,
                text: "\"Subhuti, what do you think? Does a bodhisattva adorn the Buddha land?\"",
                pinyin: "xū pú tí! yú yì yún hé? pú sà zhuāng yán fó tǔ fǒu?",
                chinese: "須菩提！於意云何？菩薩莊嚴佛土不？"
            ),
            Verse(
                number: 5,
                text: "\"No, World-honored One. And why is this? That which adorns the Buddha land is non-adornment, that is what is called adornment.\"",
                pinyin: "fǒu yě, shì zūn! hé yǐ gù? zhuāng yán fó tǔ zhě, jí fēi zhuāng yán, shì míng zhuāng yán",
                chinese: "不也，世尊！何以故？莊嚴佛土者，即非莊嚴，是名莊嚴"
            ),
            Verse(
                number: 6,
                text: "For this reason, Subhuti, all great bodhisattvas should give rise to purity of mind in this way: they should not give rise to a mind that abides in form; they should not give rise to a mind that abides in sound, smell, taste, touch, or dharmas. They should give rise to a mind that does not abide in anything.",
                pinyin: "shì gù, xū pú tí! zhū pú sà mó hē sà, yīng rú shì shēng qīng jìng xīn. bù yīng zhù sè shēng xīn, bù yīng zhù shēng, xiāng, wèi, chù, fǎ shēng xīn, yīng wú suǒ zhù, ér shēng qí xīn",
                chinese: "是故，須菩提！諸菩薩摩訶薩，應如是生清淨心。不應住色生心，不應住聲、香、味、觸、法生心，應無所住，而生其心"
            ),
            Verse(
                number: 7,
                text: "Subhuti, what do you think? If a man's body were as large as Mount Sumeru, would that body be large?",
                pinyin: "xū pú tí! pì rú yǒu rén shēn rú xū mí shān wáng. yú yì yún hé? shì shēn wéi dà fǒu?",
                chinese: "須菩提！譬如有人身如須彌山王。於意云何？是身為大不？"
            ),
            Verse(
                number: 8,
                text: "Subhuti said, \"Very large, World-honored One. And why is this? The Buddha has said that it is not the real body, and thus is called a large body.\"",
                pinyin: "xū pú tí yán: shèn dà, shì zūn! hé yǐ gù? fó shuō fēi shēn, shì míng dà shēn",
                chinese: "須菩提言：甚大，世尊！何以故？佛說非身，是名大身"
            )
        ]
        for verse in diamondChapter10.verses {
            verse.chapter = diamondChapter10
        }
        
        // MARK: Diamond Sutra - Chapter 11: The Unconditioned Is Supreme
        let diamondChapter11 = Chapter(number: 11, title: "The Unconditioned Is Supreme")
        diamondChapter11.text = diamondSutra
        diamondChapter11.verses = [
            Verse(
                number: 1,
                text: "Subhuti, if each grain of sand in the Ganges River were to become a Ganges River, and if the sand in all of those rivers were added up, what do you think? Would that be a lot of sand?",
                pinyin: "xū pú tí! rú héng hé zhōng suǒ yǒu shā shù, rú shì shā děng héng hé, yú yì yún hé? shì zhū héng hé shā, níng wéi duō fǒu?",
                chinese: "須菩提！如恆河中所有沙數，如是沙等恆河，於意云何？是諸恆河沙，寧為多不？"
            ),
            Verse(
                number: 2,
                text: "Subhuti said, \"It would be a lot, World-honored One. The number of Ganges Rivers alone would be enormous; the amount of sand would be even greater than that.\"",
                pinyin: "xū pú tí yán: shèn duō, shì zūn! dàn zhū héng hé, shàng duō wú shù, hé kuàng qí shā?",
                chinese: "須菩提言：甚多，世尊！但諸恆河，尚多無數，何況其沙？"
            ),
            Verse(
                number: 3,
                text: "Subhuti, I will now truthfully tell you: if a good man or a good woman were to give away as many three thousandfold world systems filled with the seven treasures as there are those grains of sand, would his merit be great?",
                pinyin: "xū pú tí! wǒ jīn shí yán gào rǔ, ruò yǒu shàn nán zǐ, shàn nǚ rén, yǐ qī bǎo mǎn ěr suǒ héng hé shā shù sān qiān dà qiān shì jiè, yǐ yòng bù shī, dé fú duō fǒu?",
                chinese: "須菩提！我今實言告汝，若有善男子、善女人，以七寶滿爾所恆河沙數三千大千世界，以用布施，得福多不？"
            ),
            Verse(
                number: 4,
                text: "Subhuti said, \"It would be very great, World-honored One.\"",
                pinyin: "xū pú tí yán: shèn duō, shì zūn!",
                chinese: "須菩提言：甚多，世尊！"
            ),
            Verse(
                number: 5,
                text: "The Buddha said to Subhuti, \"If a good man or a good woman receives and upholds as few as four lines of verse from this sutra, and if he explains them to others, then his merit will be greater.\"",
                pinyin: "fó gào xū pú tí: ruò shàn nán zǐ, shàn nǚ rén, yú cǐ jīng zhōng, nǎi zhì shòu chí sì jù jì děng, wèi tā rén shuō, ér cǐ fú dé, shèng qián fú dé",
                chinese: "佛告須菩提：若善男子、善女人，於此經中，乃至受持四句偈等，為他人說，而此福德，勝前福德"
            )
        ]
        for verse in diamondChapter11.verses {
            verse.chapter = diamondChapter11
        }
        
        // MARK: Diamond Sutra - Chapter 12: Honoring the True Teaching
        let diamondChapter12 = Chapter(number: 12, title: "Honoring the True Teaching")
        diamondChapter12.text = diamondSutra
        diamondChapter12.verses = [
            Verse(
                number: 1,
                text: "Furthermore, Subhuti, anyone who explains this sutra, even four lines of verse from it, should be honored by people in this world, by those in heaven, and by asuras as if he were a Buddha's stupa or shrine. What then of anyone who receives, upholds, reads, and chants the teachings of this sutra with all of his strength? Subhuti, you should know that such a person already has become accomplished in the highest and rarest Dharma. Wherever this sutra can be found, there also is the Buddha; and it should be honored as if it were one of his disciples.",
                pinyin: "fù cì, xū pú tí! suí chù shuō shì jīng, nǎi zhì sì jù jì děng, dāng zhī cǐ chù, yī qiè shì jiān, tiān rén, ā xiū luó, jiē yīng gōng yǎng, rú fó tǎ miào, hé kuàng yǒu rén jìn néng shòu chí dú sòng. xū pú tí! dāng zhī shì rén chéng jiù zuì shàng dì yī xī yǒu zhī fǎ. ruò shì jīng diǎn suǒ zài zhī chù, jí wéi yǒu fó, ruò zūn zhòng dì zǐ",
                chinese: "復次，須菩提！隨處說是經，乃至四句偈等，當知此處，一切世間、天人、阿修羅，皆應供養，如佛塔廟，何況有人盡能受持讀誦。須菩提！當知是人成就最上第一希有之法。若是經典所在之處，即為有佛，若尊重弟子"
            )
        ]
        for verse in diamondChapter12.verses {
            verse.chapter = diamondChapter12
        }
        
        // MARK: Diamond Sutra - Chapter 13: The Name of This Sutra
        let diamondChapter13 = Chapter(number: 13, title: "The Name of This Sutra")
        diamondChapter13.text = diamondSutra
        diamondChapter13.verses = [
            Verse(
                number: 1,
                text: "At that time, Subhuti asked the Buddha, \"World-honored One, what should this sutra be called, and how should we receive it and uphold it?\"",
                pinyin: "ěr shí, xū pú tí bái fó yán: shì zūn! dāng hé míng cǐ jīng? wǒ děng yún hé fèng chí?",
                chinese: "爾時，須菩提白佛言：世尊！當何名此經？我等云何奉持？"
            ),
            Verse(
                number: 2,
                text: "The Buddha said to Subhuti, \"This sutra is called the Diamond Prajnaparamita, and by this name you should receive it and uphold it. And why is this? Subhuti, the Buddha has said that prajnaparamita is not prajnaparamita, and that that is what is called prajnaparamita.\"",
                pinyin: "fó gào xū pú tí: shì jīng míng wéi jīn gāng bō rě bō luó mì, yǐ shì míng zì, rǔ dāng fèng chí. suǒ yǐ zhě hé? xū pú tí! fó shuō bō rě bō luó mì, jí fēi bō rě bō luó mì, shì míng bō rě bō luó mì",
                chinese: "佛告須菩提：是經名為金剛般若波羅蜜，以是名字，汝當奉持。所以者何？須菩提！佛說般若波羅蜜，即非般若波羅蜜，是名般若波羅蜜"
            ),
            Verse(
                number: 3,
                text: "Subhuti, what do you think? Does the Tathagata speak the Dharma?",
                pinyin: "xū pú tí! yú yì yún hé? rú lái yǒu suǒ shuō fǎ fǒu?",
                chinese: "須菩提！於意云何？如來有所說法不？"
            ),
            Verse(
                number: 4,
                text: "Subhuti said to the Buddha, \"World-honored One, the Tathagata has not said anything.\"",
                pinyin: "xū pú tí bái fó yán: shì zūn! rú lái wú suǒ shuō",
                chinese: "須菩提白佛言：世尊！如來無所說"
            ),
            Verse(
                number: 5,
                text: "Subhuti, what do you think? Is all the fine dust throughout the three thousandfold world system a lot of dust or not?",
                pinyin: "xū pú tí! yú yì yún hé? sān qiān dà qiān shì jiè suǒ yǒu wēi chén, shì wéi duō fǒu?",
                chinese: "須菩提！於意云何？三千大千世界所有微塵，是為多不？"
            ),
            Verse(
                number: 6,
                text: "Subhuti said, \"It is a lot, World-honored One.\"",
                pinyin: "xū pú tí yán: shèn duō, shì zūn!",
                chinese: "須菩提言：甚多，世尊！"
            ),
            Verse(
                number: 7,
                text: "Subhuti, the Tathagata says that all of that fine dust is not fine dust, and that that is what is called fine dust. The Tathagata says that the world is not the world, and that that is what is called the world.",
                pinyin: "xū pú tí! zhū wēi chén, rú lái shuō fēi wēi chén, shì míng wēi chén. rú lái shuō shì jiè fēi shì jiè, shì míng shì jiè",
                chinese: "須菩提！諸微塵，如來說非微塵，是名微塵。如來說世界非世界，是名世界"
            ),
            Verse(
                number: 8,
                text: "Subhuti, what do you think? Can the Tathagata be seen by his thirty-two marks?",
                pinyin: "xū pú tí! yú yì yún hé? kě yǐ sān shí èr xiàng jiàn rú lái fǒu?",
                chinese: "須菩提！於意云何？可以三十二相見如來不？"
            ),
            Verse(
                number: 9,
                text: "No, World-honored One. And why is this? The Tathagata has said that the thirty-two marks are not marks, and that that is what is called thirty-two marks.",
                pinyin: "fǒu yě, shì zūn! bù kě yǐ sān shí èr xiàng dé jiàn rú lái. hé yǐ gù? rú lái shuō sān shí èr xiàng, jí shì fēi xiàng, shì míng sān shí èr xiàng",
                chinese: "不也，世尊！不可以三十二相得見如來。何以故？如來說三十二相，即是非相，是名三十二相"
            ),
            Verse(
                number: 10,
                text: "Subhuti, suppose a good man or good woman were to give his or her own life as many times as there are grains of sand in the Ganges, if one were to receive and uphold even four verses of this sutra and explain it to others, his merit would be greater.",
                pinyin: "xū pú tí! ruò yǒu shàn nán zǐ, shàn nǚ rén, yǐ héng hé shā děng shēn mìng bù shī, ruò fù yǒu rén, yú cǐ jīng zhōng, nǎi zhì shòu chí sì jù jì děng, wèi tā rén shuō, qí fú shèn duō!",
                chinese: "須菩提！若有善男子、善女人，以恆河沙等身命布施，若復有人，於此經中，乃至受持四句偈等，為他人說，其福甚多！"
            )
        ]
        for verse in diamondChapter13.verses {
            verse.chapter = diamondChapter13
        }
        
        // MARK: Diamond Sutra - Chapter 14: Ultimate Tranquility Beyond Notions
        let diamondChapter14 = Chapter(number: 14, title: "Ultimate Tranquility Beyond Notions")
        diamondChapter14.text = diamondSutra
        diamondChapter14.verses = [
            Verse(
                number: 1,
                text: "Then, after hearing this sutra and comprehending its deep meaning, Subhuti wept out loud and said to the Buddha, \"Rare, World-honored One, the Buddha has spoken such a deep, profound sutra. Since obtaining the wisdom eye I have not heard such a sutra. World-honored One, if anyone should hear this sutra and believe it with a pure mind, then he will give rise to true reality. You should know that this person will attain the supreme, rarest virtue. World-honored One, true reality is not reality, and that is what the Tathagata calls true reality.",
                pinyin: "ěr shí, xū pú tí wén shuō shì jīng, shēn jiě yì qù, tì lèi běi qì, ér bái fó yán: xī yǒu, shì zūn! fó shuō rú shì shèn shēn jīng diǎn, wǒ cóng xī lái suǒ dé huì yǎn, wèi céng dé wén rú shì zhī jīng. shì zūn! ruò fù yǒu rén dé wén shì jīng, xìn xīn qīng jìng, jí shēng shí xiàng, dāng zhī shì rén chéng jiù dì yī xī yǒu gōng dé. shì zūn! shì shí xiàng zhě, jí shì fēi xiàng, shì gù rú lái shuō míng shí xiàng",
                chinese: "爾時，須菩提聞說是經，深解義趣，涕淚悲泣，而白佛言：希有，世尊！佛說如是甚深經典，我從昔來所得慧眼，未曾得聞如是之經。世尊！若復有人得聞是經，信心清淨，即生實相，當知是人成就第一希有功德。世尊！是實相者，即是非相，是故如來說明實相"
            ),
            Verse(
                number: 2,
                text: "World-honored One, today I have heard this sutra, believed it, understood it, received it, and upheld it, and this was not difficult. If five hundred years from now, someone should hear this sutra, believe it, understand it, receive it, and uphold it, then that person will be a rare person indeed.",
                pinyin: "shì zūn! wǒ jīn dé wén rú shì jīng diǎn, xìn jiě shòu chí bù zú wéi nán, ruò dāng lái shì hòu wǔ bǎi suì, qí yǒu zhòng shēng, dé wén shì jīng, xìn jiě shòu chí, shì rén zé wéi dì yī xī yǒu",
                chinese: "世尊！我今得聞如是經典，信解受持不足為難，若當來世後五百歲，其有眾生，得聞是經，信解受持，是人則為第一希有"
            ),
            Verse(
                number: 3,
                text: "And why is this? That person is without a notion of self, notion of others, notion of sentient beings, or notion of longevity. And why is this? The notion of a self is not a notion, and the notion of others, sentient beings, and longevity are not notions. And why is this? That which turns away from all notions is called all Buddhas.",
                pinyin: "hé yǐ gù? cǐ rén wú wǒ xiàng, wú rén xiàng, wú zhòng shēng xiàng, wú shòu zhě xiàng. suǒ yǐ zhě hé? wǒ xiàng jí shì fēi xiàng; rén xiàng, zhòng shēng xiàng, shòu zhě xiàng, jí shì fēi xiàng. hé yǐ gù? lí yī qiè zhū xiàng, jí míng zhū fó",
                chinese: "何以故？此人無我相、無人相、無眾生相、無壽者相。所以者何？我相即是非相；人相、眾生相、壽者相，即是非相。何以故？離一切諸相，即名諸佛"
            ),
            Verse(
                number: 4,
                text: "The Buddha said to Subhuti, \"So it is, so it is. Moreover, if a person hears this sutra and does not become alarmed, or frightened, or scared, then this person is indeed a rare person. And why is this? Subhuti, the Tathagata has said that the supreme paramita is not the supreme paramita, and that this is what is called the supreme paramita.",
                pinyin: "fó gào xū pú tí: rú shì, rú shì! ruò fù yǒu rén dé wén shì jīng, bù jīng, bù bù, bù wèi, dāng zhī shì rén, shèn wéi xī yǒu. hé yǐ gù? xū pú tí! rú lái shuō dì yī bō luó mì jí fēi dì yī bō luó mì, shì míng dì yī bō luó mì",
                chinese: "佛告須菩提：如是，如是！若復有人得聞是經，不驚、不怖、不畏，當知是人，甚為希有。何以故？須菩提！如來說第一波羅蜜即非第一波羅蜜，是名第一波羅蜜"
            ),
            Verse(
                number: 5,
                text: "Subhuti, the Tathagata has said that the paramita of patience is not the paramita of patience. And why is this? Subhuti, long ago when my body was being cut apart by King Kalinga, I had no notion of self, no notion of others, no notion of sentient beings, and no notion of longevity.",
                pinyin: "xū pú tí! rěn rǔ bō luó mì, rú lái shuō fēi rěn rǔ bō luó mì, shì míng rěn rǔ bō luó mì. hé yǐ gù? xū pú tí! rú wǒ xī wèi gē lì wáng gē jié shēn tǐ, wǒ yú ěr shí, wú wǒ xiàng, wú rén xiàng, wú zhòng shēng xiàng, wú shòu zhě xiàng",
                chinese: "須菩提！忍辱波羅蜜，如來說非忍辱波羅蜜，是名忍辱波羅蜜。何以故？須菩提！如我昔為歌利王割截身體，我於爾時，無我相、無人相、無眾生相、無壽者相"
            ),
            Verse(
                number: 6,
                text: "And why was this? If at that distant time, as my body was being cut apart piece by piece, if I had had a notion of self, a notion of others, a notion of sentient beings, or a notion of longevity, I would have become angry. Subhuti, think about this some more; five hundred lifetimes ago when I was a practitioner of patience, I was without a notion of self, a notion of others, a notion of sentient beings, or a notion of longevity.",
                pinyin: "hé yǐ gù? wǒ yú wǎng xī jié jié zhī jiě shí, ruò yǒu wǒ xiàng, rén xiàng, zhòng shēng xiàng, shòu zhě xiàng, yīng shēng chēn hèn. xū pú tí! yòu niàn guò qù yú wǔ bǎi shì, zuò rěn rǔ xiān rén, yú ěr suǒ shì, wú wǒ xiàng, wú rén xiàng, wú zhòng shēng xiàng, wú shòu zhě xiàng",
                chinese: "何以故？我於往昔節節支解時，若有我相、人相、眾生相、壽者相，應生瞋恨。須菩提！又念過去於五百世，作忍辱仙人，於爾所世，無我相、無人相、無眾生相、無壽者相"
            ),
            Verse(
                number: 7,
                text: "For this reason, Subhuti, a bodhisattva should turn away from all notions, and initiate the mind of anuttara samyaksambodhi. He should not give rise to a mind abiding in form, and he should not give rise to a mind abiding in sound, smell, taste, touch, or dharmas. He should give rise to a mind that does not abide in anything.",
                pinyin: "shì gù, xū pú tí! pú sà yīng lí yī qiè xiàng, fā ā nòu duō luó sān miǎo sān pú tí xīn, bù yīng zhù sè shēng xīn, bù yīng zhù shēng, xiāng, wèi, chù, fǎ shēng xīn, yīng shēng wú suǒ zhù xīn",
                chinese: "是故，須菩提！菩薩應離一切相，發阿耨多羅三藐三菩提心，不應住色生心，不應住聲、香、味、觸、法生心，應生無所住心"
            ),
            Verse(
                number: 8,
                text: "If the mind abides in anything it is a false abiding. Thus, the Buddha says that a bodhisattva should not give abiding in form. Subhuti, a bodhisattva should give in this way to benefit all sentient beings. The Tathagata says that all notions are not notions, and therefore he also says that all sentient beings are not sentient beings.",
                pinyin: "ruò xīn yǒu zhù, jí wéi fēi zhù. shì gù fó shuō pú sà xīn bù yīng zhù sè bù shī. xū pú tí! pú sà wèi lì yì yī qiè zhòng shēng gù, yīng rú shì bù shī. rú lái shuō yī qiè zhū xiàng, jí shì fēi xiàng; yòu shuō yī qiè zhòng shēng, jí fēi zhòng shēng",
                chinese: "若心有住，即為非住。是故佛說菩薩心，不應住色布施。須菩提！菩薩為利益一切眾生故，應如是布施。如來說一切諸相，即是非相；又說一切眾生，即非眾生"
            ),
            Verse(
                number: 9,
                text: "Subhuti, the Tathagata is a speaker of what is true, what is real, what is so, what is not deceptive, and what is not altered. Subhuti, the Dharma that the Tathagata has attained is not real and it is not unreal.",
                pinyin: "xū pú tí! rú lái shì zhēn yǔ zhě, shí yǔ zhě, rú yǔ zhě, bù kuáng yǔ zhě, bù yì yǔ zhě. xū pú tí! rú lái suǒ dé fǎ, cǐ fǎ wú shí wú xū",
                chinese: "須菩提！如來是真語者、實語者、如語者、不誑語者、不異語者。須菩提！如來所得法，此法無實無虛"
            ),
            Verse(
                number: 10,
                text: "Subhuti, when the mind of a bodhisattva abides in phenomena and practices giving he is like a person who has entered into darkness—he sees nothing at all. When the mind of a bodhisattva does not abide in any phenomena and practices giving, he is like someone who has eyes in the full light of the sun—he sees all forms clearly.",
                pinyin: "xū pú tí! ruò pú sà xīn zhù yú fǎ ér xíng bù shī, rú rén rù àn, jí wú suǒ jiàn. ruò pú sà xīn bù zhù fǎ ér xíng bù shī, rú rén yǒu mù, rì guāng míng zhào, jiàn zhǒng zhǒng sè",
                chinese: "須菩提！若菩薩心住於法而行布施，如人入闇，即無所見。若菩薩心不住法而行布施，如人有目，日光明明照，見種種色"
            ),
            Verse(
                number: 11,
                text: "Subhuti, if in future lifetimes there are good men and good women who can receive, uphold, read, and chant this sutra, the Tathagata fully knows and fully sees that these people will attain infinite, limitless virtue.",
                pinyin: "xū pú tí! dāng lái zhī shì, ruò yǒu shàn nán zǐ, shàn nǚ rén, néng yú cǐ jīng shòu chí dú sòng, jí wéi rú lái yǐ fó zhì huì, xī zhī shì rén, xī jiàn shì rén, jiē dé chéng jiù wú liàng wú biān gōng dé",
                chinese: "須菩提！當來之世，若有善男子、善女人，能於此經受持讀誦，即為如來以佛智慧，悉知是人，悉見是人，皆得成就無量無邊功德"
            )
        ]
        for verse in diamondChapter14.verses {
            verse.chapter = diamondChapter14
        }
        
        // MARK: Diamond Sutra - Chapter 15: The Merit of Upholding This Sutra
        let diamondChapter15 = Chapter(number: 15, title: "The Merit of Upholding This Sutra")
        diamondChapter15.text = diamondSutra
        diamondChapter15.verses = [
            Verse(
                number: 1,
                text: "Subhuti, suppose a good man or good woman were to give as many of his or her lives as there are grains of sand in the Ganges River in the morning, and give as many of his or her lives as there are grains of sand in the Ganges River at noon, and give as many of his or her lives as there are grains of sand in the Ganges River in the afternoon, and that this giving continued for infinite hundreds of millions of billions of kalpas; if someone were to hear this sutra, believe it, and not turn his mind against it, his merit would be greater—what of the merit of one who copies, receives, upholds, reads, chants, and explains it to others?",
                pinyin: "xū pú tí! ruò yǒu shàn nán zǐ, shàn nǚ rén, chū rì fēn yǐ héng hé shā děng shēn bù shī, zhōng rì fēn fù yǐ héng hé shā děng shēn bù shī, hòu rì fēn yì yǐ héng hé shā děng shēn bù shī, rú shì wú liàng bǎi qiān wàn yì jié, yǐ shēn bù shī. ruò fù yǒu rén, wén cǐ jīng diǎn, xìn xīn bù nì, qí fú shèng bǐ. hé kuàng shū xiě, shòu chí, dú sòng, wèi rén jiě shuō",
                chinese: "須菩提！若有善男子、善女人，初日分以恆河沙等身布施，中日分復以恆河沙等身布施，後日分亦以恆河沙等身布施，如是無量百千萬億劫，以身布施。若復有人，聞此經典，信心不逆，其福勝彼。何況書寫、受持、讀誦、為人解說"
            ),
            Verse(
                number: 2,
                text: "Subhuti, in summation, the virtue of this sutra is infinite and unlimited. The Tathagata speaks this sutra to those who have initiated the mind of the Great Vehicle; he speaks it to those who have initiated the mind of the Supreme Vehicle. If someone can receive, uphold, read, and chant this sutra, and explain it to others, the Tathagata fully knows and fully sees that these people will attain infinite, limitless virtue.",
                pinyin: "xū pú tí! yǐ yào yán zhī, shì jīng yǒu bù kě sī yì, bù kě chēng liàng wú biān gōng dé, rú lái wèi fā dà chéng zhě shuō, wèi fā zuì shàng chéng zhě shuō. ruò yǒu rén néng shòu chí dú sòng, guǎng wèi rén shuō, rú lái xī zhī shì rén, xī jiàn shì rén, jiē dé chéng jiù bù kě sī yì, bù kě chēng liàng, wú yǒu biān, bù kě sī yì gōng dé",
                chinese: "須菩提！以要言之，是經有不可思議、不可稱量無邊功德，如來為發大乘者說，為發最上乘者說。若有人能受持讀誦、廣為人說，如來悉知是人、悉見是人，皆得成就不可思議、不可稱、無有邊、不可思議功德"
            ),
            Verse(
                number: 3,
                text: "For those who receive, uphold, read, chant, and explain this sutra to others, the Tathagata fully knows and fully sees that such people will attain infinite, immeasurable, limitless, inconceivable virtue. All such people will shoulder the anuttara samyaksambodhi of the Tathagata. And why is this? Subhuti, those who delight in the lesser Dharma cling to a view of self, a view of others, a view of sentient beings, and a view of longevity, and thus they are not able to listen to this sutra, to receive it, to read it, to chant it, or to explain it to others.",
                pinyin: "rú shì rén děng, jí wéi hè dān rú lái ā nòu duō luó sān miǎo sān pú tí. hé yǐ gù? xū pú tí! ruò lè xiǎo fǎ zhě, zhuó wǒ jiàn, rén jiàn, zhòng shēng jiàn, shòu zhě jiàn, jí yú cǐ jīng bù néng tīng shòu dú sòng, wèi rén jiě shuō",
                chinese: "如是人等，即為荷擔如來阿耨多羅三藐三菩提。何以故？須菩提！若樂小法者，著我見、人見、眾生見、壽者見，即於此經不能聽受讀誦、為人解說"
            )
        ]
        for verse in diamondChapter15.verses {
            verse.chapter = diamondChapter15
        }
        
        // MARK: Diamond Sutra - Chapter 16: Purification of Karma
        let diamondChapter16 = Chapter(number: 16, title: "Purification of Karma")
        diamondChapter16.text = diamondSutra
        diamondChapter16.verses = [
            Verse(
                number: 1,
                text: "Subhuti, in whatever place this sutra can be found, all who are in the world should make offerings to it, as should all in heaven, and all asuras. They should treat this place as if it were a stupa; they should surround it, bow to it, and pay their deepest respect to it. They should scatter incense and flowers all around this place.",
                pinyin: "xū pú tí! zài zài chù chù, ruò yǒu cǐ jīng, yī qiè shì jiān tiān rén, ā xiū luó suǒ yīng gòng yǎng, dāng zhī cǐ chù, jí wéi shì tǎ, jiē yīng gōng jìng, zuò lǐ wéi rào, yǐ zhū huá xiāng ér sàn qí chù",
                chinese: "須菩提！在在處處，若有此經，一切世間天人、阿修羅所應供養，當知此處，即為是塔，皆應恭敬，作禮圍遶，以諸華香而散其處"
            ),
            Verse(
                number: 2,
                text: "Furthermore, Subhuti, if those good men and good women who receive, uphold, read, and chant this sutra are disdained by others, it is due to negative karma incurred in a former life. That negative karma should be the cause of the person falling into a lower realm, but in this life he is merely disdained. Eventually his negative karma from previous lives will be eradicated, and he will attain anuttara samyaksambodhi.",
                pinyin: "fù cì: xū pú tí! shàn nán zǐ, shàn nǚ rén, shòu chí dú sòng cǐ jīng, ruò wéi rén qīng jiàn, shì rén xiān shì zuì yè, yīng duò è dào. yǐ jīn shì rén qīng jiàn gù, xiān shì zuì yè jí wéi xiāo miè, dāng dé ā nòu duō luó sān miǎo sān pú tí",
                chinese: "復次：須菩提！善男子、善女人，受持讀誦此經，若為人輕賤，是人先世罪業，應墮惡道。以今世人輕賤故，先世罪業即為消滅，當得阿耨多羅三藐三菩提"
            ),
            Verse(
                number: 3,
                text: "Subhuti, I remember infinite asamkhya kalpas ago, before Dipamkara Buddha, I met, honored, served and made offerings to all of the eighty-four hundred billion nayutas of Buddhas with every opportunity.",
                pinyin: "xū pú tí! wǒ niàn guò qù wú liàng ā sēng qí jié, yú rán dēng fó qián, dé zhí bā bǎi sì qiān wàn yì nà yóu tā zhū fó, xī jiē gòng yǎng chéng shì wú kōng guò zhě",
                chinese: "須菩提！我念過去無量阿僧祇劫，於然燈佛前，得值八百四千萬億那由他諸佛，悉皆供養承事無空過者"
            )
        ]
        for verse in diamondChapter16.verses {
            verse.chapter = diamondChapter16
        }
        
        // MARK: Diamond Sutra - Chapter 17: Complete and Utter Selflessness
        let diamondChapter17 = Chapter(number: 17, title: "Complete and Utter Selflessness")
        diamondChapter17.text = diamondSutra
        diamondChapter17.verses = [
            Verse(
                number: 1,
                text: "Subhuti, you should know that the teachings of this sutra are inconceivable, and its karmic results are inconceivable.",
                pinyin: "zhī shì jīng yì bù kě sī yì, guǒ bào yì bù kě sī yì",
                chinese: "知是經義不可思議，果報亦不可思議"
            ),
            Verse(
                number: 2,
                text: "Then Subhuti asked the Buddha, \"World-honored One, when good men and good women initiate the mind to anuttara samyaksambodhi, what should they abide in? And how should they subdue their minds?\"",
                pinyin: "ěr shí, xū pú tí bái fó yán: shì zūn! shàn nán zǐ, shàn nǚ rén, fā ā nòu duō luó sān miǎo sān pú tí xīn, yún hé yīng zhù? yún hé xiáng fú qí xīn?",
                chinese: "爾時，須菩提白佛言：世尊！善男子、善女人，發阿耨多羅三藐三菩提心，云何應住？云何降伏其心？"
            ),
            Verse(
                number: 3,
                text: "The Buddha said to Subhuti, \"When good men and good women initiate the mind to anuttara samyaksambodhi, they should give rise to a mind like this: 'I should liberate all sentient beings, and as I liberate them, I should know that there really are no sentient beings to be liberated.' And why is this? If a bodhisattva has a notion of self, notion of others, notion of sentient beings, or notion of longevity, then he is not a bodhisattva. And why is this? Subhuti, in truth, there is no phenomenon of initiating the mind to anuttara samyaksambodhi.",
                pinyin: "fó gào xū pú tí: shàn nán zǐ, shàn nǚ rén, fā ā nòu duō luó sān miǎo sān pú tí xīn zhě, dāng shēng rú shì xīn: wǒ yīng miè dù yī qiè zhòng shēng. miè dù yī qiè zhòng shēng yǐ, ér wú yǒu yī zhòng shēng shí dé miè dù zhě. hé yǐ gù? ruò pú sà yǒu wǒ xiàng, rén xiàng, zhòng shēng xiàng, shòu zhě xiàng, jí fēi pú sà. hé yǐ gù? xū pú tí! shí wú yǒu fǎ, fā ā nòu duō luó sān miǎo sān pú tí xīn",
                chinese: "佛告須菩提：善男子、善女人，發阿耨多羅三藐三菩提心者，當生如是心：我應滅度一切眾生。滅度一切眾生已，而無有一眾生實得滅度者。何以故？若菩薩有我相、人相、眾生相、壽者相，即非菩薩。何以故？須菩提！實無有法，發阿耨多羅三藐三菩提心"
            ),
            Verse(
                number: 4,
                text: "Subhuti, what do you think? When the Tathagata was with Dipamkara Buddha, was there the Dharma of anuttara samyaksambodhi to attain or not?",
                pinyin: "xū pú tí! yú yì yún hé? rú lái yú rán dēng fó suǒ, yǒu fǎ dé ā nòu duō luó sān miǎo sān pú tí fǒu?",
                chinese: "須菩提！於意云何？如來於然燈佛所，有法得阿耨多羅三藐三菩提不？"
            ),
            Verse(
                number: 5,
                text: "There was not, World-honored One. As far as I understand the meaning of what the Buddha has said, when the Buddha was with Dipamkara Buddha, there was no Dharma of anuttara samyaksambodhi to attain.",
                pinyin: "bù yě, shì zūn! rú wǒ jiě fó suǒ shuō yì, fó yú rán dēng fó suǒ, wú yǒu fǎ dé ā nòu duō luó sān miǎo sān pú tí",
                chinese: "不也，世尊！如我解佛所說義，佛於然燈佛所，無有法得阿耨多羅三藐三菩提"
            ),
            Verse(
                number: 6,
                text: "The Buddha said, \"So it is, so it is. Subhuti, in truth, there is no Dharma of anuttara samyaksambodhi for the Tathagata to attain. Subhuti, if the Tathagata had attained the Dharma of anuttara samyaksambodhi, then Dipamkara Buddha would not have prophesized, 'In the future you will attain Buddhahood and be called Sakyamuni.' Since there is no Dharma of anuttara samyaksambodhi to attain, Dipamkara Buddha prophesized that I would become a Buddha, saying, 'In the future you will attain Buddhahood and be called Sakyamuni.' And why is this? 'Tathagata' means all phenomena as they are.",
                pinyin: "fó yán: rú shì, rú shì! xū pú tí! shí wú yǒu fǎ, rú lái dé ā nòu duō luó sān miǎo sān pú tí. xū pú tí! ruò yǒu fǎ, rú lái dé ā nòu duō luó sān miǎo sān pú tí zhě, rán dēng fó jí bù yǔ wǒ shòu jì: rú lái shì, yú lái shì, dāng dé zuò fó, hào shì jiā móu ní. yǐ shí wú yǒu fǎ dé ā nòu duō luó sān miǎo sān pú tí, shì gù rán dēng fó yǔ wǒ shòu jì, zuò shì yán: rú lái shì, yú lái shì, dāng dé zuò fó, hào shì jiā móu ní. hé yǐ gù? rú lái zhě, jí zhū fǎ rú yì",
                chinese: "佛言：如是，如是！須菩提！實無有法，如來得阿耨多羅三藐三菩提。須菩提！若有法，如來得阿耨多羅三藐三菩提者，然燈佛即不與我授記：如來是，於來世，當得作佛，號釋迦牟尼。以實無有法得阿耨多羅三藐三菩提，是故然燈佛與我授記，作是言：如來是，於來世，當得作佛，號釋迦牟尼。何以故？如來者，即諸法如義"
            ),
            Verse(
                number: 7,
                text: "Someone might say, 'The Tathagata has attained anuttara samyaksambodhi,' but Subhuti, there really is no Dharma of anuttara samyaksambodhi for the Buddha to attain. Subhuti, within the anuttara samyaksambodhi that the Tathagata has attained there is no real nor unreal.",
                pinyin: "ruò yǒu rén yán: rú lái dé ā nòu duō luó sān miǎo sān pú tí, xū pú tí! shí wú yǒu fǎ, fó dé ā nòu duō luó sān miǎo sān pú tí. xū pú tí! rú lái suǒ dé ā nòu duō luó sān miǎo sān pú tí, yú shì zhōng wú shí wú xū",
                chinese: "若有人言：如來得阿耨多羅三藐三菩提，須菩提！實無有法，佛得阿耨多羅三藐三菩提。須菩提！如來所得阿耨多羅三藐三菩提，於是中無實無虛"
            ),
            Verse(
                number: 8,
                text: "For these reasons, the Tathagata says that all phenomena are the Buddhadharma. Subhuti, that which is said to be all phenomena is not all phenomena, and that is why it is called all phenomena. Subhuti, it is the same as a great human body.",
                pinyin: "shì gù rú lái shuō yī qiè fǎ, jiē shì fó fǎ. xū pú tí! suǒ yán yī qiè fǎ zhě, jí fēi yī qiè fǎ, shì gù míng yī qiè fǎ. xū pú tí! pì rú rén shēn zhǎng dà",
                chinese: "是故如來說一切法，皆是佛法。須菩提！所言一切法者，即非一切法，是故名一切法。須菩提！譬如人身長大"
            ),
            Verse(
                number: 9,
                text: "Subhuti said, \"World-honored One, the Tathagata has said that a great human body is not a great human body, and that that is why it is called a great human body.\"",
                pinyin: "xū pú tí yán: shì zūn! rú lái shuō rén shēn zhǎng dà, jí wéi fēi dà shēn, shì míng dà shēn",
                chinese: "須菩提言：世尊！如來說人身長大，即為非大身，是名大身"
            ),
            Verse(
                number: 10,
                text: "Subhuti, a bodhisattva is just like that, and if he should say, 'I should liberate all sentient beings', then he is not a bodhisattva. And why is this? Subhuti, in reality there is no phenomenon called 'bodhisattva', and for this reason the Buddha has said that all phenomena are without self, without others, without sentient beings, and without longevity. Subhuti, if a bodhisattva should say, 'I will adorn the Buddha land,' then he is not a bodhisattva. And why is this? The Tathagata has said that that which adorns the Buddha land is non-adornment, and that that is what is called adornment. Subhuti, only after a bodhisattva has fully understood no self and no phenomena will the Tathagata say that he is a true bodhisattva.",
                pinyin: "xū pú tí! pú sà yì rú shì. ruò zuò shì yán: wǒ dāng miè dù wú liàng zhòng shēng, jí bù míng pú sà. hé yǐ gù? xū pú tí! shí wú yǒu fǎ, míng wéi pú sà. shì gù fó shuō: yī qiè fǎ wú wǒ, wú rén, wú zhòng shēng, wú shòu zhě. xū pú tí! ruò pú sà zuò shì yán: wǒ dāng zhuāng yán fó tǔ, shì bù míng pú sà. hé yǐ gù? rú lái shuō zhuāng yán fó tǔ zhě, jí fēi zhuāng yán, shì míng zhuāng yán. xū pú tí! ruò pú sà tōng dá wú wǒ fǎ zhě, rú lái shuō míng zhēn shì pú sà",
                chinese: "須菩提！菩薩亦如是。若作是言：我當滅度無量眾生，即不名菩薩。何以故？須菩提！實無有法，名為菩薩。是故佛說：一切法無我、無人、無眾生、無壽者。須菩提！若菩薩作是言：我當莊嚴佛土，是不名菩薩。何以故？如來說莊嚴佛土者，即非莊嚴，是名莊嚴。須菩提！若菩薩通達無我法者，如來說名真是菩薩"
            )
        ]
        for verse in diamondChapter17.verses {
            verse.chapter = diamondChapter17
        }
        
        // MARK: Diamond Sutra - Chapter 18: One Body Sees All
        let diamondChapter18 = Chapter(number: 18, title: "One Body Sees All")
        diamondChapter18.text = diamondSutra
        diamondChapter18.verses = [
            Verse(
                number: 1,
                text: "Subhuti, what do you think, does the Tathagata have eyes of flesh or not?",
                pinyin: "xū pú tí! yú yì yún hé? rú lái yǒu ròu yǎn fǒu?",
                chinese: "須菩提！於意云何？如來有肉眼不？"
            ),
            Verse(
                number: 2,
                text: "Yes, World-honored One, the Tathagata has eyes of flesh.",
                pinyin: "rú shì, shì zūn! rú lái yǒu ròu yǎn",
                chinese: "如是，世尊！如來有肉眼"
            ),
            Verse(
                number: 3,
                text: "Subhuti, what do you think, does the Tathagata have heavenly eyes or not?",
                pinyin: "xū pú tí! yú yì yún hé? rú lái yǒu tiān yǎn fǒu?",
                chinese: "須菩提！於意云何？如來有天眼不？"
            ),
            Verse(
                number: 4,
                text: "Yes, World-honored One, the Tathagata has heavenly eyes.",
                pinyin: "rú shì, shì zūn! rú lái yǒu tiān yǎn",
                chinese: "如是，世尊！如來有天眼"
            ),
            Verse(
                number: 5,
                text: "Subhuti, what do you think, does the Tathagata have wisdom eyes or not?",
                pinyin: "xū pú tí! yú yì yún hé? rú lái yǒu huì yǎn fǒu?",
                chinese: "須菩提！於意云何？如來有慧眼不？"
            ),
            Verse(
                number: 6,
                text: "Yes, World-honored One, the Tathagata has wisdom eyes.",
                pinyin: "rú shì, shì zūn! rú lái yǒu huì yǎn",
                chinese: "如是，世尊！如來有慧眼"
            ),
            Verse(
                number: 7,
                text: "Subhuti, what do you think, does the Tathagata have Dharma eyes or not?",
                pinyin: "xū pú tí! yú yì yún hé? rú lái yǒu fǎ yǎn fǒu?",
                chinese: "須菩提！於意云何？如來有法眼不？"
            ),
            Verse(
                number: 8,
                text: "Yes, World-honored One, the Tathagata has Dharma eyes.",
                pinyin: "rú shì, shì zūn! rú lái yǒu fǎ yǎn",
                chinese: "如是，世尊！如來有法眼"
            ),
            Verse(
                number: 9,
                text: "Subhuti, what do you think, does the Tathagata have Buddha eyes or not?",
                pinyin: "xū pú tí! yú yì yún hé? rú lái yǒu fó yǎn fǒu?",
                chinese: "須菩提！於意云何？如來有佛眼不？"
            ),
            Verse(
                number: 10,
                text: "Yes, World-honored One, the Tathagata has Buddha eyes.",
                pinyin: "rú shì, shì zūn! rú lái yǒu fó yǎn",
                chinese: "如是，世尊！如來有佛眼"
            ),
            Verse(
                number: 11,
                text: "Subhuti, what do you think, has the Buddha said that the sand in the Ganges River is sand or not?",
                pinyin: "xū pú tí! yú yì yún hé? rú héng hé zhōng suǒ yǒu shā, fó shuō shì shā fǒu?",
                chinese: "須菩提！於意云何？如恆河中所有沙，佛說是沙不？"
            ),
            Verse(
                number: 12,
                text: "Yes, World-honored One, the Tathagata has said that it is sand.",
                pinyin: "rú shì, shì zūn! rú lái shuō shì shā",
                chinese: "如是，世尊！如來說是沙"
            ),
            Verse(
                number: 13,
                text: "Subhuti, what do you think, if there were as many Ganges Rivers as there are grains of sand in the Ganges River, and if all of the sand in all of those rivers were added up, and if the number of Buddha worlds equaled the number of all of those grains of sand, would that be a lot?",
                pinyin: "xū pú tí! yú yì yún hé? rú yī héng hé shā, yǒu rú shì shā děng héng hé, shì zhū héng hé suǒ yǒu shā shù, fó shì jiè rú shì, níng wéi duō fǒu?",
                chinese: "須菩提！於意云何？如一恆河沙，有如是沙等恆河，是諸恆河所有沙數，佛世界如是，寧為多不？"
            ),
            Verse(
                number: 14,
                text: "It would be a lot, World-honored One.",
                pinyin: "shèn duō, shì zūn!",
                chinese: "甚多，世尊！"
            ),
            Verse(
                number: 15,
                text: "The Buddha said to Subhuti, \"The Tathagata fully knows and fully sees the minds of the sentient beings in all of these worlds. And how can this be? The Tathagata has said that all minds are not minds and that thus they are called minds. And why is this so? Subhuti, the mind of the past cannot be obtained, the mind of the present cannot be obtained, and the mind of the future cannot be obtained.",
                pinyin: "fó gào xū pú tí: ěr suǒ guó tǔ zhōng suǒ yǒu zhòng shēng, ruò gàn zhǒng xīn, rú lái xī zhī. hé yǐ gù? rú lái shuō zhū xīn, jiē wéi fēi xīn, shì míng wéi xīn. suǒ yǐ zhě hé? xū pú tí! guò qù xīn bù kě dé, xiàn zài xīn bù kě dé, wèi lái xīn bù kě dé",
                chinese: "佛告須菩提：爾所國土中所有眾生，若干種心，如來悉知。何以故？如來說諸心，皆為非心，是名為心。所以者何？須菩提！過去心不可得，現在心不可得，未來心不可得"
            )
        ]
        for verse in diamondChapter18.verses {
            verse.chapter = diamondChapter18
        }
        
        // MARK: Diamond Sutra - Chapter 19: Universal Transformation Within the Dharma Realm
        let diamondChapter19 = Chapter(number: 19, title: "Universal Transformation Within the Dharma Realm")
        diamondChapter19.text = diamondSutra
        diamondChapter19.verses = [
            Verse(
                number: 1,
                text: "Subhuti, what do you think? If someone were to fill the three thousandfold world system with the seven treasures, and used them for giving, with this as a cause and condition, would he attain immense merit?",
                pinyin: "xū pú tí! yú yì yún hé? ruò yǒu rén mǎn sān qiān dà qiān shì jiè qī bǎo, yǐ yòng bù shī, yǐ cǐ yīn yuán, dé fú duō fǒu?",
                chinese: "須菩提！於意云何？若有人滿三千大千世界七寶，以用布施，以此因緣，得福多不？"
            ),
            Verse(
                number: 2,
                text: "So it is, World-honored One. With this as a cause and condition he will attain immense merit.",
                pinyin: "rú shì, shì zūn! yǐ cǐ yīn yuán, dé fú shèn duō",
                chinese: "如是，世尊！以此因緣，得福甚多"
            ),
            Verse(
                number: 3,
                text: "Subhuti, if there really were such a thing as merit, the Tathagata would never speak about attaining immense merit. It is only because there is no such thing as merit that the Tathagata says that immense merit can be attained.",
                pinyin: "xū pú tí! ruò fú yǒu fú dé, rú lái bù shuō dé fú dé duō. yǐ wú yǒu fú dé, gù rú lái shuō dé fú dé duō",
                chinese: "須菩提！若復有福德，如來不說得福德多。以無有福德，故如來說得福德多"
            )
        ]
        for verse in diamondChapter19.verses {
            verse.chapter = diamondChapter19
        }
        
        // MARK: Diamond Sutra - Chapter 20: Beyond Form and Notions
        let diamondChapter20 = Chapter(number: 20, title: "Beyond Form and Notions")
        diamondChapter20.text = diamondSutra
        diamondChapter20.verses = [
            Verse(
                number: 1,
                text: "Subhuti, what do you think? Can the Buddha be seen by his perfect physical body?",
                pinyin: "xū pú tí! yú yì yún hé? fó kě yǐ jù zú sè shēn jiàn fǒu?",
                chinese: "須菩提！於意云何？佛可以具足色身見不？"
            ),
            Verse(
                number: 2,
                text: "No, World-honored One. The Tathagata should not be seen by his perfect physical body. And why is this? The Tathagata has said that a perfect physical body is not a perfect physical body, and that that is what is called a perfect physical body.",
                pinyin: "fǒu yě, shì zūn! rú lái bù yīng yǐ jù zú sè shēn jiàn. hé yǐ gù? rú lái shuō jù zú sè shēn, jí fēi jù zú sè shēn, shì míng jù zú sè shēn",
                chinese: "不也，世尊！如來不應以具足色身見。何以故？如來說具足色身，即非具足色身，是名具足色身"
            ),
            Verse(
                number: 3,
                text: "Subhuti, what do you think? Can the Tathagata be seen by his perfect marks?",
                pinyin: "xū pú tí! yú yì yún hé? rú lái kě yǐ jù zú zhū xiàng jiàn fǒu?",
                chinese: "須菩提！於意云何？如來可以具足諸相見不？"
            ),
            Verse(
                number: 4,
                text: "No, World-honored One. The Tathagata should not be seen by his perfect marks. And why is this? The Tathagata has said that perfect marks are not perfect marks, and that that is what is called perfect marks.",
                pinyin: "fǒu yě, shì zūn! rú lái bù yīng yǐ jù zú zhū xiàng jiàn. hé yǐ gù? rú lái shuō zhū xiàng jù zú, jí fēi jù zú, shì míng zhū xiàng jù zú",
                chinese: "不也，世尊！如來不應以具足諸相見。何以故？如來說諸相具足，即非具足，是名諸相具足"
            )
        ]
        for verse in diamondChapter20.verses {
            verse.chapter = diamondChapter20
        }
        
        // MARK: Diamond Sutra - Chapter 21: Speaking the Unspeakable
        let diamondChapter21 = Chapter(number: 21, title: "Speaking the Unspeakable")
        diamondChapter21.text = diamondSutra
        diamondChapter21.verses = [
            Verse(
                number: 1,
                text: "Subhuti, never say that the Tathagata has the thought, 'I have spoken the Dharma'. Do not have that thought. And why is this? If someone says that the Tathagata has spoken the Dharma, then that person is defaming the Buddha, and he does not understand what I have been saying. Subhuti, when a person speaks the Dharma no Dharma can be spoken, and thus it is called speaking the Dharma.",
                pinyin: "xū pú tí! rǔ wù wèi rú lái zuò shì niàn: wǒ dāng yǒu suǒ shuō fǎ. mò zuò shì niàn! hé yǐ gù? ruò rén yán: rú lái yǒu suǒ shuō fǎ, jí wéi bàng fó, bù néng jiě wǒ suǒ shuō gù. xū pú tí! shuō fǎ zhě, wú fǎ kě shuō, shì míng shuō fǎ",
                chinese: "須菩提！汝勿謂如來作是念：我當有所說法。莫作是念！何以故？若人言：如來有所說法，即為謗佛，不能解我所說故。須菩提！說法者，無法可說，是名說法"
            )
        ]
        for verse in diamondChapter21.verses {
            verse.chapter = diamondChapter21
        }
        
        // MARK: Diamond Sutra - Chapter 22: No Dharma to Attain
        let diamondChapter22 = Chapter(number: 22, title: "No Dharma to Attain")
        diamondChapter22.text = diamondSutra
        diamondChapter22.verses = [
            Verse(
                number: 1,
                text: "Then the wise Subhuti said to the Buddha, \"World-honored One, will there ever be sentient beings in the future who, upon hearing this teaching, will believe it?\"",
                pinyin: "ěr shí, huì mìng xū pú tí bái fó yán: shì zūn! pō yǒu zhòng shēng, yú wèi lái shì, wén shuō shì fǎ, shēng xìn xīn fǒu?",
                chinese: "爾時，慧命須菩提白佛言：世尊！頗有眾生，於未來世，聞說是法，生信心不？"
            ),
            Verse(
                number: 2,
                text: "The Buddha said, \"Subhuti, those sentient beings are not sentient beings, and they are not not sentient beings. And why is this? Subhuti, the Tathagata has said that all sentient beings are not sentient beings, and that this is what is called sentient beings.\"",
                pinyin: "fó yán: xū pú tí! bǐ fēi zhòng shēng, fēi bù zhòng shēng. hé yǐ gù? xū pú tí! zhòng shēng, zhòng shēng zhě, rú lái shuō fēi zhòng shēng, shì míng zhòng shēng",
                chinese: "佛言：須菩提！彼非眾生，非不眾生。何以故？須菩提！眾生，眾生者，如來說非眾生，是名眾生"
            ),
            Verse(
                number: 3,
                text: "Subhuti said to the Buddha, \"World-honored One, the Buddha attained anuttara samyaksambodhi, yet nothing was attained?\"",
                pinyin: "xū pú tí bái fó yán: shì zūn! fó dé ā nòu duō luó sān miǎo sān pú tí, wéi wú suǒ dé yě?",
                chinese: "須菩提白佛言：世尊！佛得阿耨多羅三藐三菩提，為無所得耶？"
            ),
            Verse(
                number: 4,
                text: "So it is, so it is, there is not even the slightest Dharma that can be attained in anuttara samyaksambodhi, and this is what is called anuttara samyaksambodhi.",
                pinyin: "fó yán: rú shì, rú shì! xū pú tí! wǒ yú ā nòu duō luó sān miǎo sān pú tí, nǎi zhì wú yǒu shǎo fǎ kě dé, shì míng ā nòu duō luó sān miǎo sān pú tí",
                chinese: "佛言：如是，如是！須菩提！我於阿耨多羅三藐三菩提，乃至無有少法可得，是名阿耨多羅三藐三菩提"
            )
        ]
        for verse in diamondChapter22.verses {
            verse.chapter = diamondChapter22
        }
        
        // MARK: Diamond Sutra - Chapter 23: Perfect Equanimity
        let diamondChapter23 = Chapter(number: 23, title: "Perfect Equanimity")
        diamondChapter23.text = diamondSutra
        diamondChapter23.verses = [
            Verse(
                number: 1,
                text: "Furthermore, Subhuti, the Dharma is equal and without superiority or inferiority. This is called anuttara samyaksambodhi. Cultivate all wholesome teachings without self, without others, without sentient beings, and without longevity, and thus you will attain anuttara samyaksambodhi.",
                pinyin: "fù cì: xū pú tí! shì fǎ píng děng, wú yǒu gāo xià, shì míng ā nòu duō luó sān miǎo sān pú tí. yǐ wú wǒ, wú rén, wú zhòng shēng, wú shòu zhě, xiū yī qiè shàn fǎ, jí dé ā nòu duō luó sān miǎo sān pú tí",
                chinese: "復次：須菩提！是法平等，無有高下，是名阿耨多羅三藐三菩提。以無我、無人、無眾生、無壽者，修一切善法，即得阿耨多羅三藐三菩提"
            )
        ]
        for verse in diamondChapter23.verses {
            verse.chapter = diamondChapter23
        }
        
        // MARK: Diamond Sutra - Chapter 24: True Generosity Lies in Upholding This Sutra
        let diamondChapter24 = Chapter(number: 24, title: "True Generosity Lies in Upholding This Sutra")
        diamondChapter24.text = diamondSutra
        diamondChapter24.verses = [
            Verse(
                number: 1,
                text: "Subhuti, suppose a person gives a quantity of the seven treasures equal to all the Sumeru mountains within a three thousandfold world system; if another person were to use this prajnaparamita sutra, even as few as four lines of verse, and receive, uphold, read, chant, and explain it to others, his merit would be one hundred times—nay, a hundred million, billion times, nay, an incalculable number of times that cannot even be suggested by metaphors—greater.",
                pinyin: "xū pú tí! ruò sān qiān dà qiān shì jiè zhōng suǒ yǒu zhū xū mí shān, rú shì dé qī bǎo, yǒu rén chí yòng bù shī. ruò rén yǐ cǐ bō rě bō luó mì jīng, nǎi zhì sì jù jì děng, shòu chí dú sòng, wèi tā rén shuō, yú qián fú dé, bǎi fēn bù jí yī, bǎi qiān wàn yì fēn, nǎi zhì suàn shù pì yù suǒ bù néng jí",
                chinese: "須菩提！若三千大千世界中所有諸須彌山，如是等七寶，有人持用布施。若人以此般若波羅蜜經，乃至四句偈等，受持讀誦，為他人說，於前福德，百分不及一，百千萬億分，乃至算數譬喻所不能及"
            )
        ]
        for verse in diamondChapter24.verses {
            verse.chapter = diamondChapter24
        }
        
        // MARK: Diamond Sutra - Chapter 25: Transforming That Which Cannot Be Transformed
        let diamondChapter25 = Chapter(number: 25, title: "Transforming That Which Cannot Be Transformed")
        diamondChapter25.text = diamondSutra
        diamondChapter25.verses = [
            Verse(
                number: 1,
                text: "Subhuti, what do you think? Do not say that the Tathagata has this thought: 'I should liberate sentient beings'. Subhuti, do not have this thought. And why is this? In reality, there are no sentient beings for the Tathagata to liberate. If there were sentient beings for the Tathagata to liberate, then the Tathagata would have a notion of self, others, sentient beings, and longevity.",
                pinyin: "xū pú tí! yú yì yún hé? rǔ děng wù wèi rú lái zuò shì niàn: wǒ dāng duó zhòng shēng. xū pú tí! mò zuò shì niàn! hé yǐ gù? shí wú yǒu zhòng shēng rú lái duó zhě. ruò yǒu zhòng shēng rú lái duó zhě, rú lái jí yǒu wǒ, rén, zhòng shēng, shòu zhě",
                chinese: "須菩提！於意云何？汝等勿謂如來作是念：我當度眾生。須菩提！莫作是念！何以故？實無有眾生如來度者。若有眾生如來度者，如來即有我、人、眾生、壽者"
            ),
            Verse(
                number: 2,
                text: "Subhuti, when the Tathagata speaks of a self, it is the same as no self, and yet all ordinary people take it as a self. Subhuti, the Tathagata says that ordinary people are not ordinary people, and that this is what is called ordinary people.",
                pinyin: "xū pú tí! rú lái shuō yǒu wǒ zhě, jí fēi yǒu wǒ, ér fán fú zhī rén, yǐ wéi yǒu wǒ. xū pú tí! fán fú zhě, rú lái shuō jí fēi fán fú, shì míng fán fú",
                chinese: "須菩提！如來說有我者，即非有我，而凡夫之人，以為有我。須菩提！凡夫者，如來說即非凡夫，是名凡夫"
            )
        ]
        for verse in diamondChapter25.verses {
            verse.chapter = diamondChapter25
        }
        
        // MARK: Diamond Sutra - Chapter 26: The Dharma Body Is Without Notion
        let diamondChapter26 = Chapter(number: 26, title: "The Dharma Body Is Without Notion")
        diamondChapter26.text = diamondSutra
        diamondChapter26.verses = [
            Verse(
                number: 1,
                text: "Subhuti, what do you think? Can the Tathagata be contemplated through his thirty-two marks or not?",
                pinyin: "xū pú tí! yú yì yún hé? kě yǐ sān shí èr xiàng guān rú lái fǒu?",
                chinese: "須菩提！於意云何？可以三十二相觀如來不？"
            ),
            Verse(
                number: 2,
                text: "Subhuti said, \"So it is, so it is. The Tathagata can be contemplated through his thirty-two marks.\"",
                pinyin: "xū pú tí yán: rú shì, rú shì! yǐ sān shí èr xiàng guān rú lái",
                chinese: "須菩提言：如是，如是！以三十二相觀如來"
            ),
            Verse(
                number: 3,
                text: "The Buddha said, \"Subhuti, if the Tathagata could be contemplated through his thirty-two marks, then a wheel turning monarch would be the same as the Tathagata.\"",
                pinyin: "fó yán: xū pú tí! ruò yǐ sān shí èr xiàng guān rú lái zhě, zhuàn lún shèng wáng jí shì rú lái",
                chinese: "佛言：須菩提！若以三十二相觀如來者，轉輪聖王即是如來"
            ),
            Verse(
                number: 4,
                text: "Subhuti said to the Buddha, \"World-honored One, as far as I understand the meaning of what the Buddha has said, one should not contemplate the Tathagata by his thirty-two marks.\"",
                pinyin: "xū pú tí bái fó yán: shì zūn! rú wǒ jiě fó suǒ shuō yì, bù yīng yǐ sān shí èr xiàng guān rú lái",
                chinese: "須菩提白佛言：世尊！如我解佛所說義，不應以三十二相觀如來"
            ),
            Verse(
                number: 5,
                text: "At that time, the World-honored One spoke this verse: If anyone should think that I can be seen among forms, Or that I can be sought among sounds, Then that person is on the wrong path And he will not see the Tathagata.",
                pinyin: "ěr shí, shì zūn ér shuō jì yán: ruò yǐ sè jiàn wǒ, yǐ yīn shēng qiú wǒ, shì rén xíng xié dào, bù néng jiàn rú lái",
                chinese: "爾時，世尊而說偈言：若以色見我，以音聲求我，是人行邪道，不能見如來"
            )
        ]
        for verse in diamondChapter26.verses {
            verse.chapter = diamondChapter26
        }
        
        // MARK: Diamond Sutra - Chapter 27: Nothing Is Ended and Nothing Is Extinguished
        let diamondChapter27 = Chapter(number: 27, title: "Nothing Is Ended and Nothing Is Extinguished")
        diamondChapter27.text = diamondSutra
        diamondChapter27.verses = [
            Verse(
                number: 1,
                text: "Subhuti, suppose you had this thought: 'It is not because his marks are complete that the Tathagata attains anuttara samyaksambodhi.' Subhuti, do not have this thought, 'It is not because his marks are complete that the Tathagata attains anuttara samyaksambodhi.'",
                pinyin: "xū pú tí! rǔ ruò zuò shì niàn: rú lái bù yǐ jù zú xiàng gù, dé ā nòu duō luó sān miǎo sān pú tí. xū pú tí! mò zuò shì niàn: rú lái bù yǐ jù zú xiàng gù, dé ā nòu duō luó sān miǎo sān pú tí",
                chinese: "須菩提！汝若作是念：如來不以具足相故，得阿耨多羅三藐三菩提。須菩提！莫作是念：如來不以具足相故，得阿耨多羅三藐三菩提"
            ),
            Verse(
                number: 2,
                text: "Subhuti, suppose you had this thought: 'Those who initiate the mind of anuttara samyaksambodhi advocate the Dharma of annihilation.' Do not have this thought. And why is this? Those who initiate the mind of anuttara samyaksambodhi, in regards to the Dharma, do not advocate the notions of annihilation.",
                pinyin: "xū pú tí! rǔ ruò zuò shì niàn: fā ā nòu duō luó sān miǎo sān pú tí xīn zhě, shuō zhū fǎ duàn miè. mò zuò shì niàn! hé yǐ gù? fā ā nòu duō luó sān miǎo sān pú tí xīn zhě, yú fǎ bù shuō duàn miè xiàng",
                chinese: "須菩提！汝若作是念：發阿耨多羅三藐三菩提心者，說諸法斷滅。莫作是念！何以故？發阿耨多羅三藐三菩提心者，於法不說斷滅相"
            )
        ]
        for verse in diamondChapter27.verses {
            verse.chapter = diamondChapter27
        }
        
        // MARK: Diamond Sutra - Chapter 28: Not Receiving and Not Wanting to Receive
        let diamondChapter28 = Chapter(number: 28, title: "Not Receiving and Not Wanting to Receive")
        diamondChapter28.text = diamondSutra
        diamondChapter28.verses = [
            Verse(
                number: 1,
                text: "Subhuti, suppose a bodhisattva gave a quantity of the seven treasures capable of filling as many worlds as there are grains of sand in the Ganges River; if a bodhisattva knows that all phenomena are without self and thereby attains patience, the virtue he attains is superior. Subhuti, this is because all bodhisattvas do not receive this merit.",
                pinyin: "xū pú tí! ruò pú sà yǐ mǎn héng hé shā déng shì jiè qī bǎo chí yòng bù shī. ruò pú sà zhī yī qiè fǎ wú wǒ, dé chéng yú rěn rǔ, cǐ pú sà shèng qián pú sà suǒ dé gōng dé. hé yǐ gù? xū pú tí! yǐ zhū pú sà bù shòu fú dé gù",
                chinese: "須菩提！若菩薩以滿恆河沙等世界七寶持用布施。若菩薩知一切法無我，得成於忍，此菩薩勝前菩薩所得功德。何以故？須菩提！以諸菩薩不受福德故"
            ),
            Verse(
                number: 2,
                text: "Subhuti said to the Buddha, \"World-honored One, why is it that bodhisattvas do not receive merit?\"",
                pinyin: "xū pú tí bái fó yán: shì zūn! yún hé pú sà bù shòu fú dé?",
                chinese: "須菩提白佛言：世尊！云何菩薩不受福德？"
            ),
            Verse(
                number: 3,
                text: "Subhuti, the merit of a bodhisattva should not be attached to. That is why it is said that they do not receive merit.",
                pinyin: "xū pú tí! pú sà suǒ zuò fú dé, bù yīng tān zhuó, shì gù shuō: bù shòu fú dé",
                chinese: "須菩提！菩薩所作福德，不應貪著，是故說：不受福德"
            )
        ]
        for verse in diamondChapter28.verses {
            verse.chapter = diamondChapter28
        }
        
        // MARK: Diamond Sutra - Chapter 29: Awesome Tranquility
        let diamondChapter29 = Chapter(number: 29, title: "Awesome Tranquility")
        diamondChapter29.text = diamondSutra
        diamondChapter29.verses = [
            Verse(
                number: 1,
                text: "Subhuti, if someone says, 'Tathagata means \"thus come,\" does he come? Does he go? Does he sit? Does he lie down?' then this person has not understood my meaning. And why is this? The Tathagata has not come from anywhere, and he does not go anywhere, and that is why he is called the Tathagata.",
                pinyin: "xū pú tí! ruò yǒu rén yán: rú lái ruò lái, ruò qù, ruò zuò, ruò wò, shì rén bù jiě wǒ suǒ shuō yì. hé yǐ gù? rú lái zhě, wú suǒ cóng lái, yì wú suǒ qù, gù míng rú lái",
                chinese: "須菩提！若有人言：如來若來、若去；若坐、若臥，是人不解我所說義。何以故？如來者，無所從來，亦無所去，故名如來"
            )
        ]
        for verse in diamondChapter29.verses {
            verse.chapter = diamondChapter29
        }
        
        // MARK: Diamond Sutra - Chapter 30: Compound Notions
        let diamondChapter30 = Chapter(number: 30, title: "Compound Notions")
        diamondChapter30.text = diamondSutra
        diamondChapter30.verses = [
            Verse(
                number: 1,
                text: "Subhuti, if a good man or a good woman were to pulverize a three thousandfold world system into fine dust, what do you think, would that collection of fine dust be a lot or not?",
                pinyin: "xū pú tí! ruò shàn nán zǐ, shàn nǚ rén, yǐ sān qiān dà qiān shì jiè suì wéi wēi chén, yú yì yún hé? shì wēi chén zhòng, níng wéi duō fǒu?",
                chinese: "須菩提！若善男子、善女人，以三千大千世界碎為微塵，於意云何？是微塵眾，寧為多不？"
            ),
            Verse(
                number: 2,
                text: "It would be a lot, World-honored One. And why is this? If that collection of fine dust were something that really existed, the Buddha would not have called it a collection of fine dust. And why is this? The Buddha has said that a collection of fine dust is not a collection of fine dust and so it is called a collection of fine dust.",
                pinyin: "shèn duō, shì zūn! hé yǐ gù? ruò shì wēi chén zhòng shí yǒu zhě, fó jí bù shuō shì wēi chén zhòng. hé yǐ gù? fó shuō wēi chén zhòng, jí fēi wēi chén zhòng, shì míng wēi chén zhòng",
                chinese: "甚多，世尊！何以故？若是微塵眾實有者，佛即不說微塵眾。何以故？佛說微塵眾，即非微塵眾，是名微塵眾"
            ),
            Verse(
                number: 3,
                text: "World-honored One, the three thousandfold world system the Tathagata has spoken about is not a three thousandfold world system and that is what is called a three thousandfold world system. And why is this? If that world really existed, then it would be a unified form. The Tathagata has said that a unified form is not a unified form, and so it is called a unified form.",
                pinyin: "shì zūn! rú lái suǒ shuō sān qiān dà qiān shì jiè, jí fēi shì jiè, shì míng shì jiè. hé yǐ gù? ruò shì jiè shí yǒu zhě, jí shì yī hé xiàng. rú lái shuō yī hé xiàng, jí fēi yī hé xiàng, shì míng yī hé xiàng",
                chinese: "世尊！如來所說三千大千世界，即非世界，是名世界。何以故？若世界實有者，即是一合相。如來說一合相，即非一合相，是名一合相"
            ),
            Verse(
                number: 4,
                text: "Subhuti, that which is a unified form cannot really be spoken about, and yet ordinary people are attached to it.",
                pinyin: "xū pú tí! yī hé xiàng zhě, jí shì bù kě shuō, dàn fán fú zhī rén, tān zhuó qí shì",
                chinese: "須菩提！一合相者，即是不可說，但凡夫之人，貪著其事"
            )
        ]
        for verse in diamondChapter30.verses {
            verse.chapter = diamondChapter30
        }
        
        // MARK: Diamond Sutra - Chapter 31: Not Giving Rise to Belief in Notions
        let diamondChapter31 = Chapter(number: 31, title: "Not Giving Rise to Belief in Notions")
        diamondChapter31.text = diamondSutra
        diamondChapter31.verses = [
            Verse(
                number: 1,
                text: "Subhuti, if a person were to say, 'The Tathagata teaches a view of self, a view of others, a view of sentient beings, and a view of longevity', Subhuti, what do you think, has this person understood the meaning of what I am saying?",
                pinyin: "xū pú tí! ruò rén yán: fó shuō wǒ jiàn, rén jiàn, zhòng shēng jiàn, shòu zhě jiàn. xū pú tí! yú yì yún hé? shì rén jiě wǒ suǒ shuō yì fǒu?",
                chinese: "須菩提！若人言：佛說我見、人見、眾生見、壽者見。須菩提！於意云何？是人解我所說義不？"
            ),
            Verse(
                number: 2,
                text: "No, World-honored One. This person has not understood the meaning of what the Tathagata is saying. And why is this? The World-honored One has said that a view of self, a view of others, a view of sentient beings, and a view of longevity is not a view of self, a view of others, a view of sentient beings, and a view of longevity, and so it is called a view of self, a view of others, a view of sentient beings, and a view of longevity.",
                pinyin: "bù yě, shì zūn! shì rén bù jiě rú lái suǒ shuō yì. hé yǐ gù? shì zūn shuō wǒ jiàn, rén jiàn, zhòng shēng jiàn, shòu zhě jiàn, jí fēi wǒ jiàn, rén jiàn, zhòng shēng jiàn, shòu zhě jiàn, shì míng wǒ jiàn, rén jiàn, zhòng shēng jiàn, shòu zhě jiàn",
                chinese: "不也，世尊！是人不解如來所說義。何以故？世尊說我見、人見、眾生見、壽者見，即非我見、人見、眾生見、壽者見，是名我見、人見、眾生見、壽者見"
            ),
            Verse(
                number: 3,
                text: "Subhuti, one who initiates the mind of anuttara samyaksambodhi should not give rise to the notion of phenomena. He should know all phenomena in this way; he should know and view them like this, and believe and understand them like this. Subhuti, the Tathagata says that that which is called a notion of phenomena is not a notion of phenomena, and so it is called a notion of phenomena.",
                pinyin: "xū pú tí! fā ā nòu duō luó sān miǎo sān pú tí xīn zhě, yú yī qiè fǎ, yīng rú shì zhī, rú shì jiàn, rú shì xìn jiě, bù shēng fǎ xiàng. xū pú tí! suǒ yán fǎ xiàng zhě, rú lái shuō jí fēi fǎ xiàng, shì míng fǎ xiàng",
                chinese: "須菩提！發阿耨多羅三藐三菩提心者，於一切法，應如是知、如是見、如是信解，不生法相。須菩提！所言法相者，如來說即非法相，是名法相"
            )
        ]
        for verse in diamondChapter31.verses {
            verse.chapter = diamondChapter31
        }
        
        // MARK: Diamond Sutra - Chapter 32: Like Shadows, Like Bubbles, Like Dreams
        let diamondChapter32 = Chapter(number: 32, title: "Like Shadows, Like Bubbles, Like Dreams")
        diamondChapter32.text = diamondSutra
        diamondChapter32.verses = [
            Verse(
                number: 1,
                text: "Subhuti, suppose a person were to give a quantity of the seven treasures capable of filling infinite asamkhya worlds, if a good man or good woman were to initiate the bodhisattva mind and use this sutra, even as few as four lines of verse from it, and were to receive, uphold, read, chant, and explain it to others, his merit is greater. And how should this sutra be taught to people? By not grasping to notions and being unmoved by things as they are. And why is this?",
                pinyin: "xū pú tí! ruò yǒu rén yǐ mǎn wú liàng ā sēng qí shì jiè qī bǎo, chí yòng bù shī. ruò yǒu shàn nán zǐ, shàn nǚ rén, fā pú tí xīn zhě, chí yú cǐ jīng, nǎi zhì sì jù jì děng, shòu chí dú sòng, wèi rén yǎn shuō, qí fú shèng bǐ. yún hé wèi rén yǎn shuō? bù qǔ yú xiàng, rú rú bù dòng. hé yǐ gù?",
                chinese: "須菩提！若有人以滿無量阿僧祇世界七寶，持用布施。若有善男子、善女人，發菩提心者，持於此經，乃至四句偈等，受持讀誦，為人演說，其福勝彼。云何為人演說？不取於相，如如不動。何以故？"
            ),
            Verse(
                number: 2,
                text: "All conditioned phenomena Are like dreams, illusions, bubbles, and shadows, Like dew and lightning. One should contemplate them in this way.",
                pinyin: "yī qiè yǒu wéi fǎ, rú mèng, huàn, pào, yǐng, rú lù, yì rú diàn, yīng zuò rú shì guān",
                chinese: "一切有為法，如夢、幻、泡、影，如露，亦如電，應作如是觀"
            ),
            Verse(
                number: 3,
                text: "When the Buddha finished speaking this sutra, the elder Subhuti, along with all the bhiksus, bhiksunis, upasakas, upasikas, asuras, and worldly and celestial beings, heard what the Buddha had said, and all of them were greatly pleased, and they all believed it, received it, and practiced it.",
                pinyin: "fó shuō shì jīng yǐ, zhǎng lǎo xū pú tí, jí zhū bǐ qiū, bǐ qiū ní, yōu pó sāi, yōu pó yí, yī qiè shì jiān tiān, rén, ā xiū luó, wén fó suǒ shuō, jiē dà huān xǐ, xìn shòu fèng xíng",
                chinese: "佛說是經已，長老須菩提，及諸比丘、比丘尼、優婆塞、優婆夷，一切世間天、人、阿修羅，聞佛所說，皆大歡喜，信受奉行"
            )
        ]
        for verse in diamondChapter32.verses {
            verse.chapter = diamondChapter32
        }
        
        // MARK: Diamond Sutra - Triple Refuge
        let diamondTripleRefuge = Chapter(number: 33, title: "Triple Refuge")
        diamondTripleRefuge.text = diamondSutra
        diamondTripleRefuge.verses = [
            Verse(
                number: 1,
                text: "I take refuge in the Buddha, wishing that all sentient beings understand the Dharma and make the supreme vow.",
                pinyin: "zì guī yī fó, dāng yuàn zhòng shēng, tǐ jiě dà dào, fā wú shàng xīn",
                chinese: "自皈依佛，當願眾生，體解大道，發無上心"
            ),
            Verse(
                number: 2,
                text: "I take refuge in the Dharma, wishing that all sentient beings study the sutras diligently and obtain an ocean of wisdom.",
                pinyin: "zì guī yī fǎ, dāng yuàn zhòng shēng, shēn rù jīng zàng, zhì huì rú hǎi",
                chinese: "自皈依法，當願眾生，深入經藏，智慧如海"
            ),
            Verse(
                number: 3,
                text: "I take refuge in the Sangha, wishing that all sentient beings lead the masses in harmony without obstruction.",
                pinyin: "zì guī yī sēng, dāng yuàn zhòng shēng, tǒng lǐ dà zhòng, yī qiè wú ài",
                chinese: "自皈依僧，當願眾生，統理大眾，一切無礙"
            )
        ]
        for verse in diamondTripleRefuge.verses {
            verse.chapter = diamondTripleRefuge
        }
        
        // MARK: Diamond Sutra - Dedication of Merit
        let diamondDedication = Chapter(number: 34, title: "Dedication of Merit")
        diamondDedication.text = diamondSutra
        diamondDedication.verses = [
            Verse(
                number: 1,
                text: "May kindness, compassion, joy, and equanimity pervade the dharma realms;",
                pinyin: "cí bēi xǐ shě biàn fǎ jiè",
                chinese: "慈悲喜捨遍法界"
            ),
            Verse(
                number: 2,
                text: "May all people and heavenly beings benefit from our blessings and friendship;",
                pinyin: "xī fú jié yuán lì rén tiān",
                chinese: "惜福結緣利人天"
            ),
            Verse(
                number: 3,
                text: "May our ethical practice of Chan, Pure Land, and Precepts help us to realize equality and patience;",
                pinyin: "chán jìng jiè hèng píng děng rěn",
                chinese: "禪淨戒行平等忍"
            ),
            Verse(
                number: 4,
                text: "May we undertake the great vows with humility and gratitude.",
                pinyin: "cán kuì gǎn ēn dà yuàn xīn",
                chinese: "慚愧感恩大願心"
            )
        ]
        for verse in diamondDedication.verses {
            verse.chapter = diamondDedication
        }
        
        diamondSutra.chapters.append(contentsOf: [diamondChapter1, diamondChapter2, diamondChapter3, diamondChapter4, diamondChapter5, diamondChapter6, diamondChapter7, diamondChapter8, diamondChapter9, diamondChapter10, diamondChapter11, diamondChapter12, diamondChapter13, diamondChapter14, diamondChapter15, diamondChapter16, diamondChapter17, diamondChapter18, diamondChapter19, diamondChapter20, diamondChapter21, diamondChapter22, diamondChapter23, diamondChapter24, diamondChapter25, diamondChapter26, diamondChapter27, diamondChapter28, diamondChapter29, diamondChapter30, diamondChapter31, diamondChapter32, diamondTripleRefuge, diamondDedication])
        context.insert(diamondSutra)
        }
        
        // MARK: - Four Noble Truths
        if shouldLoadFourNobleTruths {
        let fourNobleTruths = BuddhistText(
            title: "The Four Noble Truths",
            author: "Buddha",
            textDescription: "The foundation of Buddhist teaching",
            category: "Teaching"
        )
        
        let truthChapter1 = Chapter(number: 1, title: "The Truth of Suffering")
        truthChapter1.text = fourNobleTruths
        truthChapter1.verses = [
            Verse(number: 1, text: "Now this, monks, is the noble truth of suffering: Birth is suffering, aging is suffering, death is suffering; sorrow, lamentation, pain, grief, and despair are suffering; association with the unbeloved is suffering; separation from the loved is suffering; not getting what is wanted is suffering."),
            Verse(number: 2, text: "In short, the five clinging-aggregates are suffering.")
        ]
        for verse in truthChapter1.verses {
            verse.chapter = truthChapter1
        }
        
        let truthChapter2 = Chapter(number: 2, title: "The Truth of the Origin of Suffering")
        truthChapter2.text = fourNobleTruths
        truthChapter2.verses = [
            Verse(number: 1, text: "Now this, monks, is the noble truth of the origin of suffering: It is craving which produces renewal of being, is accompanied by delight and lust, and delights in this and that; that is, craving for sensual pleasures, craving for being, and craving for non-being.")
        ]
        for verse in truthChapter2.verses {
            verse.chapter = truthChapter2
        }
        
        let truthChapter3 = Chapter(number: 3, title: "The Truth of the Cessation of Suffering")
        truthChapter3.text = fourNobleTruths
        truthChapter3.verses = [
            Verse(number: 1, text: "Now this, monks, is the noble truth of the cessation of suffering: It is the remainderless fading away and ceasing, the giving up, relinquishing, letting go, and rejecting of that same craving.")
        ]
        for verse in truthChapter3.verses {
            verse.chapter = truthChapter3
        }
        
        let truthChapter4 = Chapter(number: 4, title: "The Truth of the Path to the Cessation of Suffering")
        truthChapter4.text = fourNobleTruths
        truthChapter4.verses = [
            Verse(number: 1, text: "Now this, monks, is the noble truth of the way leading to the cessation of suffering: It is this Noble Eightfold Path; that is, right view, right intention, right speech, right action, right livelihood, right effort, right mindfulness, right concentration.")
        ]
        for verse in truthChapter4.verses {
            verse.chapter = truthChapter4
        }
        
        fourNobleTruths.chapters.append(contentsOf: [truthChapter1, truthChapter2, truthChapter3, truthChapter4])
        context.insert(fourNobleTruths)
        }
        
        // MARK: - Eightfold Path
        if shouldLoadEightfoldPath {
        let eightfoldPath = BuddhistText(
            title: "The Noble Eightfold Path",
            author: "Buddha",
            textDescription: "The path to the end of suffering",
            category: "Teaching"
        )
        
        let pathChapter1 = Chapter(number: 1, title: "Wisdom")
        pathChapter1.text = eightfoldPath
        pathChapter1.verses = [
            Verse(number: 1, text: "Right View: Understanding the Four Noble Truths, karma, and the nature of reality."),
            Verse(number: 2, text: "Right Intention: The intention of renunciation, freedom from ill will, and harmlessness.")
        ]
        for verse in pathChapter1.verses {
            verse.chapter = pathChapter1
        }
        
        let pathChapter2 = Chapter(number: 2, title: "Ethical Conduct")
        pathChapter2.text = eightfoldPath
        pathChapter2.verses = [
            Verse(number: 1, text: "Right Speech: Abstaining from false speech, malicious speech, harsh speech, and idle chatter."),
            Verse(number: 2, text: "Right Action: Abstaining from taking life, from stealing, and from sexual misconduct."),
            Verse(number: 3, text: "Right Livelihood: Abstaining from trades that directly or indirectly harm others.")
        ]
        for verse in pathChapter2.verses {
            verse.chapter = pathChapter2
        }
        
        let pathChapter3 = Chapter(number: 3, title: "Mental Discipline")
        pathChapter3.text = eightfoldPath
        pathChapter3.verses = [
            Verse(number: 1, text: "Right Effort: The effort to prevent unwholesome states from arising, to abandon unwholesome states that have arisen, to arouse wholesome states that have not arisen, and to maintain wholesome states that have arisen."),
            Verse(number: 2, text: "Right Mindfulness: Mindfulness of the body, feelings, mind, and mental objects."),
            Verse(number: 3, text: "Right Concentration: The development of the jhanas, states of deep meditative absorption.")
        ]
        for verse in pathChapter3.verses {
            verse.chapter = pathChapter3
        }
        
        eightfoldPath.chapters.append(contentsOf: [pathChapter1, pathChapter2, pathChapter3])
        context.insert(eightfoldPath)
        }
        
        // MARK: - Samadhi Water Repentance
        if shouldLoadWaterRepentance {
        let waterRepentance = BuddhistText(
            title: "Samadhi Water Repentance (慈悲三昧水懺科儀)",
            author: "Master Wuda",
            textDescription: "Liturgy of the Samadhi Water Repentance of Kindness and Compassion - Scroll One",
            category: "Liturgy"
        )
        
        // MARK: Water Repentance - Chapter 1: True Incense of Precepts and Concentration
        let waterChapter1 = Chapter(number: 1, title: "True Incense of Precepts and Concentration")
        waterChapter1.text = waterRepentance
        waterChapter1.verses = [
            Verse(
                number: 0,
                text: "LITURGY OF THE SAMADHI WATER REPENTANCE OF KINDNESS AND COMPASSION - SCROLL ONE",
                pinyin: "cí bēi sān mèi shuǐ chàn kē yí ‧ juàn shàng",
                chinese: "【慈 悲 三 昧 水 懺 科 儀 ‧ 卷 上】"
            ),
            Verse(
                number: 1,
                text: "[Bow + Venerate the Buddha with Three Prostrations + Bow]",
                pinyin: "wèn xùn lǐ fó sān bài wèn xùn",
                chinese: "問 訊 禮 佛 三 拜 問 訊"
            ),
            Verse(
                number: 2,
                text: "[True Incense of Precepts and Concentration Praise]",
                pinyin: "jiè dìng zhēn xiāng zàn",
                chinese: "戒 定 真 香 讚"
            ),
            Verse(
                number: 3,
                text: "True incense of precepts and meditative concentration burns, rushing to the heavens above.",
                pinyin: "● jiè dìng zhēn xiāng fén qǐ chōng tiān shàng",
                chinese: "戒 定 真 香 焚 起 衝 天 上"
            ),
            Verse(
                number: 4,
                text: "Disciples devout and sincere, burn it in a golden censer.",
                pinyin: "zhòng děng qián chéng rè zài jīn lú fàng",
                chinese: "眾 等 虔 誠 爇 在 金 爐 放"
            ),
            Verse(
                number: 5,
                text: "Instantaneously it spreads, permeating the ten directions.",
                pinyin: "qǐng kè yīn yūn jí piàn mǎn shí fāng",
                chinese: "頃 刻 氤 氳 即 徧 滿 十 方"
            ),
            Verse(
                number: 6,
                text: "All peoples, past and present, avert calamities and eradicate obstructions!",
                pinyin: "gǔ jīn rén mín miǎn nàn xiāo zāi zhàng",
                chinese: "古 今 人 民 免 難 消 災 障"
            ),
            Verse(
                number: 7,
                text: "Homage to the Incense Cloud Canopy Bodhisattva-Mahāsattvas!",
                pinyin: "▲ ná mó xiāng yún gài pú sà mó hē sà (3x)",
                chinese: "南 無 香 雲 蓋 菩 薩 摩 訶 薩"
            )
        ]
        for verse in waterChapter1.verses {
            verse.chapter = waterChapter1
        }
        
        // MARK: Water Repentance - Chapter 2: Prologue and Background
        let waterChapter2 = Chapter(number: 2, title: "Prologue and Background")
        waterChapter2.text = waterRepentance
        waterChapter2.verses = [
            Verse(
                number: 1,
                text: "Respectfully listen! The Tathāgata manifests to respond to and universally benefit all beings; the Honored One practiced kindness and reverently record this.",
                pinyin: "● gōng wén rú lái yìng huà pǔ lì qún jī zūn zhě xīng cí xián zūn",
                chinese: "恭 聞 ‧ 如 來 應 化 ‧ 普 利 羣 機 ‧ 尊 者 興 慈 ‧ 咸 尊"
            ),
            Verse(
                number: 2,
                text: "Just as how the moon is reflected in the water of a pure river, the kāmalā disease manifested as an illusory ailment.",
                pinyin: "hòu jì jiāng chéng yuè yìng jiā mó luó jí ér jiǎ shì huàn yí",
                chinese: "後 記 。 江 澄 月 映 ‧ 迦 摩 羅 疾 而 假 示 幻 儀"
            ),
            Verse(
                number: 3,
                text: "A moral downfall and deep attachment arose when the king favored [Master Wuda] and bestowed a precious throne upon him.",
                pinyin: "dé sǔn ēn nóng chà dì lì chǒng ér róng yīng bǎo zuò",
                chinese: "德 損 恩 濃 ‧ 剎 帝 利 寵 而 榮 膺 寶 座"
            ),
            Verse(
                number: 4,
                text: "Yao Cuo had harbored a grudge ever since the [Battle of the] Eastern City and searched far and wide; Yuan Yang, who had formed the enmity during the Western Han, was faced with inevitable retribution—it was only a matter of time.",
                pinyin: "yáo cuò hán dōng shì zhī hèn sì xì xún shēn yuán yàng jié xī hàn zhī chóu",
                chinese: "晁 錯 含 東 市 之 恨 ‧ 伺 隙 尋 伸 ‧ 袁 盎 結 西 漢 之 讎"
            ),
            Verse(
                number: 5,
                text: "Thus, cause and effect were not in vain. From the Han to the Tang dynasty, [the grudge] was pulled throughout time.",
                pinyin: "chéng shí huò bào yóu shì guǒ yīn wú shuǎng lì hàn táng ér yǐn mǎn zhāo rán",
                chinese: "乘 時 獲 報 。 由 是 果 因 無 爽 ‧ 歷 漢 唐 而 引 滿 昭 然"
            ),
            Verse(
                number: 6,
                text: "However, upon violating the precepts, demonic enmity appeared, and thus [Master Wuda was afflicted] by an ulcer which grew a human face.",
                pinyin: "zhēn sú xiāng wéi chí jiè lǜ ér mó yuān wǎn ěr suǒ yǐ chuāng shēng rén miàn",
                chinese: "眞 俗 相 違 ‧ 弛 戒 律 而 魔 冤 宛 爾 。 所 以 瘡 生 人 面"
            ),
            Verse(
                number: 7,
                text: "It was impossible to stop the pain and suffering that came from this ulcer.",
                pinyin: "qǐ jū zhī tòng kǔ nán jīn",
                chinese: "起 居 之 痛 苦 難 禁"
            ),
            Verse(
                number: 8,
                text: "By encountering and befriending a sacred being, he accepted instructions and believed in them.",
                pinyin: "yǒu yù shèng liú shòu shòu zhī méng yán kān xìn",
                chinese: "友 遇 聖 流 ‧ 授 受 之 盟 言 堪 信"
            ),
            Verse(
                number: 9,
                text: "He traveled deep into a dark forest of fragrant grasses and wandered in search for a thousand miles.",
                pinyin: "yì lù bì nì fāng cǎo hé wò yě qiān lǐ zhī zhuī xún",
                chinese: "驛 路 睤 睨 芳 草 合 ‧ 沃 野 千 里 之 追 尋"
            ),
            Verse(
                number: 10,
                text: "Encountering a mountain pass where white clouds soared in the skies above, he passed through land after land and peak after peak.",
                pinyin: "guān shān tiáo dì bái yún fēi jǐn guó céng fēng zhī rù wàng",
                chinese: "關 山 迢 遞 白 雲 飛 ‧ 錦 國 層 峰 之 入 望"
            ),
            Verse(
                number: 11,
                text: "With earnest sincerity, his toil was effortless; with profound hope, his vows would lead him to his destination.",
                pinyin: "chéng zhòng láo qīng qiú shēn yuàn dá",
                chinese: "誠 重 勞 輕 ‧ 求 深 願 達"
            ),
            Verse(
                number: 12,
                text: "Twin pines formed a canopy over the entrance, and upon glimpsing it, his sorrows disappeared.",
                pinyin: "shuāng sōng zhāng gài hán xié zhào ér yǎng zhǐ chóu xiāo",
                chinese: "雙 松 張 蓋 ‧ 含 斜 照 而 仰 止 愁 消"
            ),
            Verse(
                number: 13,
                text: "The Nine Peaks soared into the sky, the lonely sound of a bell dispelled the darkness and the peaks and valleys filled with light.",
                pinyin: "jiǔ lǒng líng zhōng sàn shǔ zhòng yán wàn hè liú guāng",
                chinese: "九 隴 凌 鐘 散 曙 ‧ 重 巖 萬 壑 流 光"
            ),
            Verse(
                number: 14,
                text: "Honored Kanaka taught him to wash [his ulcer] with the Dharma water of samādhi, revealing a monastery which shone with a brilliant golden radiance.",
                pinyin: "zūn zhě jiā nuò dào kōng xiǎn fàn chà ér jīn guāng huī yào",
                chinese: "尊 者 迦 諾 ‧ 道 空 顯 梵 剎 而 金 光 輝 耀"
            ),
            Verse(
                number: 15,
                text: "Upon being welcomed, he announced that he wished to quickly cure his illness.",
                pinyin: "féng yíng qǐ gào yuàn jué jí zhī zǎo liào",
                chinese: "逢 迎 啓 告 ‧ 願 厥 疾 之 早 瘳"
            ),
            Verse(
                number: 16,
                text: "Comforting him, [the monk] explained that he could be free [of the illness] by bathing in a spring of sweet water.",
                pinyin: "ān wèi tián yí yù gān quán zhī kě tuō",
                chinese: "安 慰 恬 怡 ‧ 浴 甘 泉 之 可 脫"
            ),
            Verse(
                number: 17,
                text: "At the last part of the night, he washed with the Dharma water of samādhi.",
                pinyin: "hòu yè gū xǐ sān mèi zhī fǎ shuǐ",
                chinese: "後 夜 孤 洗 三 昧 之 法 水"
            ),
            Verse(
                number: 18,
                text: "National Master Wuda eradicated his afflictions from past lifetimes.",
                pinyin: "guó shī wù dá juān chú lěi shì zhī qiān yóu",
                chinese: "國 師 悟 達 ‧ 蠲 除 累 世 之 愆 尤"
            ),
            Verse(
                number: 19,
                text: "Although the event happened just once, its Dharma circulates perpetually.",
                pinyin: "shì qǐ yì shí fǎ liú qiān gǔ",
                chinese: "事 啓 一 時 ‧ 法 流 千 古"
            ),
            Verse(
                number: 20,
                text: "It was compiled as a liturgy in three scrolls—as such, humans and devas venerate it.",
                pinyin: "zhuàn wéi shàng zhòng xià sān juàn zhī yí wén rén tiān jìng yǎng",
                chinese: "撰 為 上 中 下 三 卷 之 儀 文 ‧ 人 天 敬 仰"
            ),
            Verse(
                number: 21,
                text: "It is used to repent for the transgressions of the ten unwholesome deeds which arise from one's body, speech, and mind—as such, sacred and ordinary beings seek refuge in it.",
                pinyin: "chàn mó shēn kǒu yì shí è zhī zuì yè fán shèng guī chóng",
                chinese: "懺 摩 身 口 意 十 惡 之 罪 業 ‧ 凡 聖 皈 崇"
            ),
            Verse(
                number: 22,
                text: "Proclaiming its teachings, one directs the compassionate ferry to transcend the ocean of fear.",
                pinyin: "yí xùn xiá xuān jià cí háng ér zhí chāo bù hǎi",
                chinese: "遺 訓 遐 宣 ‧ 駕 慈 航 而 直 超 怖 海"
            ),
            Verse(
                number: 23,
                text: "Venerating its profound names, one walks the path to awakening to forever leave the wheel of suffering.",
                pinyin: "hóng míng dǐng lǐ yóu jué lù ér yǒng tuō kǔ lún",
                chinese: "洪 名 頂 禮 ‧ 由 覺 路 而 永 脫 苦 輪"
            ),
            Verse(
                number: 24,
                text: "Leaving our defiled home of the five degenerations; we are born together in the pure land of nine grades of lotuses.",
                pinyin: "jiǒng chū chén láo wǔ zhuó zhī xiāng gòng shēng jìng yù jiǔ lián zhī guǒ",
                chinese: "迥 出 塵 勞 五 濁 之 鄕 ‧ 共 生 淨 域 九 蓮 之 果"
            ),
            Verse(
                number: 25,
                text: "[This text] benefits both our friends and foes; its virtues reach both the living and the deceased.",
                pinyin: "yuān qīn pǔ lì cún mò zhān ēn",
                chinese: "冤 親 普 利 ‧ 存 沒 沾 恩"
            ),
            Verse(
                number: 26,
                text: "Thus, as the repentance text is about to begin, we prostrate to Samantabhadra, King of Vows,",
                pinyin: "zī zhě chàn wén zhào qǐ yǎng kòu pǔ xián",
                chinese: "茲 者 懺 文 肇 啓 ‧ 仰 叩 普 賢"
            ),
            Verse(
                number: 27,
                text: "and visualize incense and flowers as an offering to the Tamers of the ten directions. Wishing for",
                pinyin: "yuàn wáng yùn xiǎng xiāng huā gòng yǎng shí fāng tiáo yù yù yán",
                chinese: "願 王 ‧ 運 想 香 花 供 養 十 方 調 御 。 欲 嚴"
            ),
            Verse(
                number: 28,
                text: "a solemn and pure repentance altar, we first recite secret verses; praying for wholesome fruits to ripen, we must first cause the flowers of transgression to wilt. Prostrating to the Great Compassionate One, may he manifest a great spiritual response!",
                pinyin: "dà zhāng líng yìng qīng jìng zhī chàn tán xiān sòng mì mì zhī zhāng jù yào qí shàn guǒ yǐ zhōu lóng bì shǐ zuì huā ér diāo xiè yǎng kòu hóng cí",
                chinese: "大 彰 靈 應 清 淨 之 懺 壇 ‧ 先 誦 秘 密 之 章 句 。 要 祈 善 果 以 週 隆 ‧ 必 使 罪 花 而 彫 謝 。 仰 叩 洪 慈"
            )
        ]
        for verse in waterChapter2.verses {
            verse.chapter = waterChapter2
        }
        
        // MARK: Water Repentance - Chapter 3: Entering Repentance
        let waterChapter3 = Chapter(number: 3, title: "Entering Repentance")
        waterChapter3.text = waterRepentance
        waterChapter3.verses = [
            Verse(
                number: 1,
                text: "Respectfully listen! When one Buddha appears in the world, he opens the eighty-four thousand Dharma gates.",
                pinyin: "gōng wén yì fó chū shì kāi bā wàn sì qiān zhī fǎ mén",
                chinese: "恭 聞 ‧ 一 佛 出 世 ‧ 開 八 萬 四 千 之 法 門"
            ),
            Verse(
                number: 2,
                text: "When one moon abides in the sky, it dispels the darkness of the nine obscurities which cover the land.",
                pinyin: "yí yuè zài tiān pò dà dì jiǔ yōu zhī hūn àn",
                chinese: "一 月 在 天 ‧ 破 大 地 九 幽 之 昏 暗"
            ),
            Verse(
                number: 3,
                text: "Expanding the wondrous path of the One Vehicle and repenting all transgressions, we rely on and proclaim to the Seven Buddhas, World-Honored Ones.",
                pinyin: "kuò yí chèng zhī miào dào chàn yí qiè zhī qiān yóu yǎng qǐ qī fó shì zūn",
                chinese: "廓 一 乘 之 妙 道 ‧ 懺 一 切 之 愆 尤 。 仰 啓 七 佛 世 尊"
            ),
            Verse(
                number: 4,
                text: "Within this sanctuary, we and our fellow practitioners have burned incense, scattered flowers, kneeled, and joined our palms.",
                pinyin: "wǒ zhū xíng rén yú qí tán nèi shāo xiāng sàn huā hú guì hé zhǎng",
                chinese: "我 諸 行 人 ‧ 於 其 壇 內 ‧ 燒 香 散 花 ‧ 胡 跪 合 掌"
            ),
            Verse(
                number: 5,
                text: "We venerate the Triple Gem of the ten directions, seek refuge in the Golden Sage of Great Awakening, and sincerely confess [our transgressions].",
                pinyin: "dǐng lǐ shí fāng sān bǎo guī yī dà jué jīn xiān kěn qiè tóu chéng",
                chinese: "頂 禮 十 方 三 寶 ‧ 皈 依 大 覺 金 仙 。 懇 切 投 誠"
            ),
            Verse(
                number: 6,
                text: "We have purified our three karmas, and we are single-mindedly concentrated as we burn incense, scatter flowers, and repent and reform.",
                pinyin: "sān yè qīng jìng yì niàn jīng zhuān fā lù chàn huǐ",
                chinese: "三 業 清 淨 ‧ 一 念 精 專 。 發 露 懺 悔"
            ),
            Verse(
                number: 7,
                text: "We humbly think of how this assembly of your disciples was deluded to the one nature and thus drowned in the four kinds of birth.",
                pinyin: "fú niàn mǒu děng yí xìng chén mí gǔ mò yú sì shēng zhī nèi",
                chinese: "伏 念 某 等 ‧ 一 性 沈 迷 ‧ 汩 沒 於 四 生 之 內"
            ),
            Verse(
                number: 8,
                text: "Not realizing the one truth, we transmigrated in the six realms.",
                pinyin: "yì zhēn hūn mèi lún zhuǎn yú liù qù zhī zhōng",
                chinese: "一 眞 昏 昧 ‧ 輪 轉 於 六 趣 之 中"
            ),
            Verse(
                number: 9,
                text: "Through our body, speech, and mind, we were bound by desire, anger, and ignorance, thus committing various unwholesome deeds and creating limitless karmic obstacles.",
                pinyin: "yóu shì zì shēn kǒu yì zòng tān chēn chī miù zuò wàng wéi zào wú biān zhī yè zhàng",
                chinese: "由 是 恣 身 口 意 ‧ 縱 貪 瞋 癡 。 謬 作 妄 為 ‧ 造 無 邊 之 業 障"
            ),
            Verse(
                number: 10,
                text: "We followed falsity and evil, giving rise to many kinds of transgressions.",
                pinyin: "suí xié zhú è qǐ duō zhǒng zhī qiān yóu",
                chinese: "隨 邪 逐 惡 ‧ 起 多 種 之 愆 尤"
            ),
            Verse(
                number: 11,
                text: "Above and below the heavens, none resemble the Buddha; Throughout the ten directions, there are none who can compare.",
                pinyin: "tiān shàng tiān xià wú rú fó shí fāng shì jiè yì wú bǐ",
                chinese: "天 上 天 下 無 如 佛 ‧ 十 方 世 界 亦 無 比"
            ),
            Verse(
                number: 12,
                text: "In all that I have seen throughout the worlds, There is nobody who resembles the Buddha.",
                pinyin: "shì jiān suǒ yǒu wǒ jìn jiàn yí qiè wú yǒu rú fó zhě",
                chinese: "世 間 所 有 我 盡 見 ‧ 一 切 無 有 如 佛 者"
            ),
            Verse(
                number: 13,
                text: "Initiating and employing the Repentance-Dharma of the Kind and Compassionate Sanctuary of Awakening, single-mindedly, we seek refuge in the myriad buddhas of the three time periods!",
                pinyin: "qǐ yùn cí bēi dào chǎng chàn fǎ yì xīn guī mìng sān shì zhū fó",
                chinese: "啓 運 慈 悲 道 場 懺 法 ‧ 一 心 皈 命 三 世 諸 佛"
            ),
            Verse(
                number: 14,
                text: "Homage to the past Vipaśyin Buddha, Śikhin Buddha, Viśvabhū Buddha, Krakucchanda Buddha, Kanakamuni Buddha, Kāśyapa Buddha, our teacher Śākyamuni Buddha, and future descending-birth, honored Maitreya Buddha.",
                pinyin: "ná mó guò qù pí pó shī fó ná mó shī qì fó ná mó pí shě fú fó ná mó jū liú sūn fó ná mó jū nà hán móu ní fó ná mó jiā shè fó ná mó běn shī shì jiā móu ní fó ná mó dāng lái mí lè zūn fó",
                chinese: "南 無 過 去 毗 婆 尸 佛 南 無 尸 棄 佛 南 無 毗 舍 浮 佛 南 無 拘 留 孫 佛 南 無 拘 那 含 牟 尼 佛 南 無 迦 葉 佛 南 無 本 師 釋 迦 牟 尼 佛 南 無 當 來 彌 勒 尊 佛"
            ),
            Verse(
                number: 15,
                text: "Homage to Samantabhadra Bodhisattva-Mahāsattva!",
                pinyin: "▲ ná mó pǔ xián wáng pú sà mó hē sà (3x)",
                chinese: "南 無 普 賢 王 菩 薩 摩 訶 薩"
            ),
            Verse(
                number: 16,
                text: "There is a bodhisattva who sits in full lotus. His name is Samantabhadra,",
                pinyin: "yǒu yī pú sà jié jiā fū zuò míng yuē pǔ xián",
                chinese: "有 一 菩 薩 結 跏 趺 坐 名 曰 普 賢"
            ),
            Verse(
                number: 17,
                text: "and his body is the color of white jade. He emits fifty kinds of lights—lights in fifty colors—",
                pinyin: "shēn bái yù sè wǔ shí zhǒng guāng wǔ shí zhǒng sè",
                chinese: "身 白 玉 色 五 十 種 光 五 十 種 色"
            ),
            Verse(
                number: 18,
                text: "as an aura around his neck.",
                pinyin: "yǐ wéi xiàng guāng",
                chinese: "以 為 項 光"
            ),
            Verse(
                number: 19,
                text: "The pores on his body emit golden light.",
                pinyin: "shēn zhū máo kǒng liú chū jīn guāng",
                chinese: "身 諸 毛 孔 流 出 金 光"
            ),
            Verse(
                number: 20,
                text: "Within the rays of golden light are infinite manifested buddhas and manifested bodhisattvas",
                pinyin: "qí jīn guāng duān wú liàng huà fó zhū huà pú sà",
                chinese: "其 金 光 端 無 量 化 佛 諸 化 菩 薩"
            ),
            Verse(
                number: 21,
                text: "who form his retinue.",
                pinyin: "yǐ wéi juàn shǔ",
                chinese: "以 為 眷 屬"
            ),
            Verse(
                number: 22,
                text: "Walking with graceful and peaceful steps, large jeweled blossoms rain down",
                pinyin: "ān xiáng xú bù yǔ dà bǎo huā",
                chinese: "安 庠 徐 步 雨 大 寶 花"
            ),
            Verse(
                number: 23,
                text: "as he approaches the practitioner. His elephant opens its mouth, and atop the elephant's tusks",
                pinyin: "zhì xíng zhě qián qí xiàng kāi kǒu yú xiàng yá shàng",
                chinese: "至 行 者 前 其 象 開 口 於 象 牙 上"
            ),
            Verse(
                number: 24,
                text: "are ponds with jade goddesses drumming, dancing, strumming, and singing. The sounds [of the music] are subtle and wondrous.",
                pinyin: "zhū chí yù nǚ gǔ yuè xián gē qí shēng wéi miào",
                chinese: "諸 池 玉 女 鼓 樂 絃 歌 其 聲 微 妙"
            ),
            Verse(
                number: 25,
                text: "They praise the Mahāyāna, the Path of One Reality.",
                pinyin: "zàn tàn dà chèng yī shí zhī dào",
                chinese: "讚 嘆 大 乘 一 實 之 道"
            ),
            Verse(
                number: 26,
                text: "After the practitioner sees this, he is delighted and respectfully prostrates.",
                pinyin: "xíng zhě jiàn yǐ huān xǐ jìng lǐ",
                chinese: "行 者 見 已 歡 喜 敬 禮"
            ),
            Verse(
                number: 27,
                text: "Then, he recites the profound sūtras,",
                pinyin: "fù gèng dú sòng shèn shēn jīng diǎn",
                chinese: "復 更 讀 誦 甚 深 經 典"
            ),
            Verse(
                number: 28,
                text: "universally venerates the infinite manifested buddhas in the ten directions,",
                pinyin: "piàn lǐ shí fāng wú liàng zhū fó",
                chinese: "徧 禮 十 方 無 量 諸 佛"
            ),
            Verse(
                number: 29,
                text: "venerates Prabhūtaratna Buddha's stupa",
                pinyin: "lǐ duō bǎo fó tǎ",
                chinese: "禮 多 寶 佛 塔"
            ),
            Verse(
                number: 30,
                text: "and Śākyamuni [Buddha], as well as Samantabhadra. All great bodhisattvas",
                pinyin: "jí shì jiā móu ní bìng lǐ pǔ xián zhū dà pú sà",
                chinese: "及 釋 迦 牟 尼 并 禮 普 賢 諸 大 菩 薩"
            ),
            Verse(
                number: 31,
                text: "make this vow: If my past merits allow me to see Samantabhadra,",
                pinyin: "fā shì shì yuàn ruò wǒ sù fú yīng jiàn pǔ xián",
                chinese: "發 是 誓 願 若 我 宿 福 應 見 普 賢"
            ),
            Verse(
                number: 32,
                text: "then may the Honored Universal Auspiciousness manifest to me in a physical form!",
                pinyin: "yuàn zūn zhě piàn jí shì wǒ sè shēn",
                chinese: "願 尊 者 徧 吉 示 我 色 身"
            ),
            Verse(
                number: 33,
                text: "Homage to Samantabhadra Bodhisattva-Mahāsattva!",
                pinyin: "▲ ná mó pǔ xián wáng pú sà mó hē sà (3x)",
                chinese: "南 無 普 賢 王 菩 薩 摩 訶 薩"
            ),
            Verse(
                number: 34,
                text: "All be reverent and solemn!",
                pinyin: "● yí qiè gōng jìng",
                chinese: "一 切 恭 敬"
            ),
            Verse(
                number: 35,
                text: "Single-mindedly prostrate to the Eternally Abiding Buddhas in the Dharma realms of the ten directions!",
                pinyin: "● yì xīn dǐng lǐ shí fāng fǎ jiè cháng zhù fó",
                chinese: "一 心 頂 禮 ‧ 十 方 法 界 常 住 佛"
            ),
            Verse(
                number: 36,
                text: "Single-mindedly prostrate to the Eternally Abiding Dharma in the Dharma realms of the ten directions!",
                pinyin: "yì xīn dǐng lǐ shí fāng fǎ jiè cháng zhù fǎ",
                chinese: "一 心 頂 禮 ‧ 十 方 法 界 常 住 法"
            ),
            Verse(
                number: 37,
                text: "Single-mindedly prostrate to the Eternally Abiding Sangha in the Dharma realms of the ten directions!",
                pinyin: "yì xīn dǐng lǐ shí fāng fǎ jiè cháng zhù sēng",
                chinese: "一 心 頂 禮 ‧ 十 方 法 界 常 住 僧"
            ),
            Verse(
                number: 38,
                text: "Each in the assembly, all kneel down. Solemnly hold the incense and flowers and offer them in accordance with the Dharma.",
                pinyin: "● shì zhū zhòng děng gè gè hú guì yán chí xiāng huā rú fǎ gòng yǎng",
                chinese: "是 諸 衆 等 各 各 胡 跪 嚴 持 香 花 如 法 供 養"
            ),
            Verse(
                number: 39,
                text: "May these incense and flowers pervade the ten directions and become a subtle and wondrous platform of light;",
                pinyin: "● yuàn cǐ xiāng huā piàn shí fāng yǐ wéi wéi miào guāng míng tái",
                chinese: "願 此 香 花 徧 十 方 以 為 微 妙 光 明 臺"
            ),
            Verse(
                number: 40,
                text: "various kinds of celestial music, and precious celestial incenses;",
                pinyin: "zhū tiān yīn yuè tiān bǎo xiāng",
                chinese: "諸 天 音 樂 天 寶 香"
            ),
            Verse(
                number: 41,
                text: "various celestial delicacies, and precious celestial robes;",
                pinyin: "zhū tiān yáo shàn tiān bǎo yī",
                chinese: "諸 天 餚 饍 天 寶 衣"
            ),
            Verse(
                number: 42,
                text: "and inconceivable and wondrous dharma sense objects.",
                pinyin: "bù kě sī yì miào fǎ chén",
                chinese: "不 可 思 議 妙 法 塵"
            ),
            Verse(
                number: 43,
                text: "Each of these [six sense] objects manifests all sense objects;",
                pinyin: "yī yī chén chū yí qiè chén",
                chinese: "一 一 塵 出 一 切 塵"
            ),
            Verse(
                number: 44,
                text: "each of these [six sense] objects manifests all phenomena.",
                pinyin: "yī yī chén chū yí qiè fǎ",
                chinese: "一 一 塵 出 一 切 法"
            ),
            Verse(
                number: 45,
                text: "[These offerings] spin and adorn each other without obstruction, spreading and arriving before the Triple Gem of the ten directions.",
                pinyin: "xuán zhuǎn wú ài hù zhuāng yán piàn zhì shí fāng sān bǎo qián",
                chinese: "旋 轉 無 礙 互 莊 嚴 徧 至 十 方 三 寶 前"
            ),
            Verse(
                number: 46,
                text: "And before all of the Triple Gem in the Dharma Realms of the ten directions,",
                pinyin: "shí fāng fǎ jiè sān bǎo qián",
                chinese: "十 方 法 界 三 寶 前"
            ),
            Verse(
                number: 47,
                text: "my own body is making this offering, with each of my bodies appearing throughout Dharma realms.",
                pinyin: "xī yǒu wǒ shēn xiū gòng yǎng yī yī jiē xī piàn fǎ jiè",
                chinese: "悉 有 我 身 修 供 養 一 一 皆 悉 徧 法 界"
            ),
            Verse(
                number: 48,
                text: "[These offerings] do not interfere or obstruct each other, and until the limits of the future, they conduct the Buddha's work;",
                pinyin: "bǐ bǐ wú zá wú zhàng ài jǐn wèi lái jì zuò fó shì",
                chinese: "彼 彼 無 雜 無 障 礙 盡 未 來 際 作 佛 事"
            ),
            Verse(
                number: 49,
                text: "[their fragrance] universally permeates all sentient beings in the Dharma Realm,",
                pinyin: "pǔ xūn fǎ jiè zhū zhòng shēng",
                chinese: "普 熏 法 界 諸 衆 生"
            ),
            Verse(
                number: 50,
                text: "and those who are permeated [by its fragrance] all give rise to the bodhi mind and together enter the state of non-arising, awakening to the Buddha's wisdom!",
                pinyin: "méng xūn jiē fā pú tí xīn tóng rù wú shēng zhèng fó zhì",
                chinese: "蒙 熏 皆 發 菩 提 心 同 入 無 生 證 佛 智"
            ),
            Verse(
                number: 51,
                text: "May this cloud of incense and flowers fill the realms in the ten directions",
                pinyin: "● yuàn cǐ xiāng huā yún piàn mǎn shí fāng jiè",
                chinese: "願 此 香 花 雲 徧 滿 十 方 界"
            ),
            Verse(
                number: 52,
                text: "as an offering to all buddhas, the honored Dharma, all bodhisattvas,",
                pinyin: "gòng yǎng yí qiè fó zūn fǎ zhū pú sà",
                chinese: "供 養 一 切 佛 尊 法 諸 菩 薩"
            ),
            Verse(
                number: 53,
                text: "the assembly of pratyekabuddhas and śrāvakas, and to all heavenly sages.",
                pinyin: "wú biān shēng wén zhòng jí yí qiè tiān xiān",
                chinese: "無 邊 聲 聞 衆 及 一 切 天 仙"
            ),
            Verse(
                number: 54,
                text: "It establishes a platform of light which is larger than the boundless realms,",
                pinyin: "yǐ qǐ guāng míng tái guò yú wú biān jiè",
                chinese: "以 起 光 明 臺 過 於 無 邊 界"
            ),
            Verse(
                number: 55,
                text: "and in the boundless buddha-lands, it is accepted and used for the Buddha's work,",
                pinyin: "wú biān fó tǔ zhōng shòu yong zuò fó shì",
                chinese: "無 邊 佛 土 中 受 用 作 佛 事"
            ),
            Verse(
                number: 56,
                text: "universally permeating sentient beings so that all give rise to the bodhi mind.",
                pinyin: "pǔ xūn zhū zhòng shēng jiē fā pú tí xīn",
                chinese: "普 熏 諸 衆 生 皆 發 菩 提 心"
            ),
            Verse(
                number: 57,
                text: "His face and appearance are truly wondrous; his radiance illuminates the ten directions.",
                pinyin: "● róng yán shèn qí miào guāng míng zhào shí fāng",
                chinese: "容 顏 甚 奇 妙 光 明 照 十 方"
            ),
            Verse(
                number: 58,
                text: "We have made such offerings before, and now draw near again.",
                pinyin: "wǒ shì céng gòng yǎng jīn fù huán qīn jìn",
                chinese: "我 適 曾 供 養 今 復 還 親 近"
            ),
            Verse(
                number: 59,
                text: "To the sacred lord, king among gods, whose voice resembles that of a kalaviṅka,",
                pinyin: "shèng zhǔ tiān zhōng wáng jiā líng pín qié shēng",
                chinese: "聖 主 天 中 王 迦 陵 頻 伽 聲"
            ),
            Verse(
                number: 60,
                text: "who empathizes with sentient beings, we now respectfully prostrate!",
                pinyin: "āi mǐn zhòng shēng zhě wǒ děng jīn jìng lǐ",
                chinese: "哀 愍 衆 生 者 我 等 今 敬 禮"
            ),
            Verse(
                number: 61,
                text: "Homage to Precious Uḍumbara Blossom Bodhisattva-Mahāsattva!",
                pinyin: "▲ ná mó bǎo tán huá pú sà mó hē sà (3x)",
                chinese: "南 無 寶 曇 華 菩 薩 摩 訶 薩"
            ),
            Verse(
                number: 62,
                text: "Prayer of Entering Repentance, Scroll One",
                pinyin: "● rù chàn wén",
                chinese: "入 懺 文"
            ),
            Verse(
                number: 63,
                text: "Respectfully listen! When one Buddha appears in the world, he opens the eighty-four thousand Dharma gates;",
                pinyin: "gōng wén yì fó chū shì kāi bā wàn sì qiān zhī fǎ mén",
                chinese: "恭 聞 ‧ 一 佛 出 世 ‧ 開 八 萬 四 千 之 法 門"
            ),
            Verse(
                number: 64,
                text: "when one moon abides in the sky, it dispels the darkness of the nine obscurities which cover the land.",
                pinyin: "yí yuè zài tiān pò dà dì jiǔ yōu zhī hūn àn",
                chinese: "一 月 在 天 ‧ 破 大 地 九 幽 之 昏 暗"
            ),
            Verse(
                number: 65,
                text: "Expanding the wondrous path of the One Vehicle and repenting all transgressions,",
                pinyin: "kuò yí chèng zhī miào dào chàn yí qiè zhī qiān yóu",
                chinese: "廓 一 乘 之 妙 道 ‧ 懺 一 切 之 愆 尤"
            ),
            Verse(
                number: 66,
                text: "we rely on and proclaim to the Seven Buddhas, World-Honored Ones: may the compassionate fathers of the ten directions who possess serene marks, characteristics, and radiance, witness our sincerity!",
                pinyin: "yǎng qǐ qī fó shì zūn shí fāng cí fù shū háo xiàng guāng jiàn zī qián kěn",
                chinese: "仰 啓 七 佛 世 尊 ‧ 十 方 慈 父 ‧ 舒 毫 相 光 ‧ 鑑 茲 虔 懇"
            ),
            Verse(
                number: 67,
                text: "Now, on behalf of this assembly of your disciples who seek repentance, we respectfully face the base of your golden lotus throne and practice the Water Repentance Dharma Gate.",
                pinyin: "jīn zé fèng wéi qiú chàn mǒu děng gōng duì jīn lián zuò xià xūn xiū shuǐ chàn fǎ mén",
                chinese: "今 則 奉 為 求 懺 某 等 ‧ 恭 對 金 蓮 座 下 ‧ 熏 修 水 懺 法 門"
            ),
            Verse(
                number: 68,
                text: "Now, we begin the first scroll by entering the sanctuary.",
                pinyin: "jīn dāng dì yī juàn rù tán yuán qǐ",
                chinese: "今 當 第 一 卷 ‧ 入 壇 緣 起"
            ),
            Verse(
                number: 69,
                text: "Within this sanctuary, we and our fellow practitioners have burned incense, scattered flowers, kneeled, and joined our palms.",
                pinyin: "wǒ zhū xíng rén yú qí tán nèi shāo xiāng sàn huā hú guì hé zhǎng",
                chinese: "我 諸 行 人 ‧ 於 其 壇 內 ‧ 燒 香 散 花 ‧ 胡 跪 合 掌"
            ),
            Verse(
                number: 70,
                text: "We venerate the Triple Gem of the ten directions, seek refuge in the Golden Sage of Great Awakening, and sincerely confess [our transgressions].",
                pinyin: "dǐng lǐ shí fāng sān bǎo guī yī dà jué jīn xiān kěn qiè tóu chéng fā lù chàn huǐ",
                chinese: "頂 禮 十 方 三 寶 ‧ 皈 依 大 覺 金 仙 。 懇 切 投 誠 ‧ 發 露 懺 悔"
            ),
            Verse(
                number: 71,
                text: "We humbly think of how this assembly of your disciples was deluded to the one nature and thus drowned in the four kinds of birth.",
                pinyin: "fú niàn mǒu děng yí xìng chén mí gǔ mò yú sì shēng zhī nèi",
                chinese: "伏 念 某 等 ‧ 一 性 沈 迷 ‧ 汩 沒 於 四 生 之 內"
            ),
            Verse(
                number: 72,
                text: "Not realizing the one truth, we transmigrated in the six realms.",
                pinyin: "yì zhēn hūn mèi lún zhuǎn yú liù qù zhī zhōng",
                chinese: "一 眞 昏 昧 ‧ 輪 轉 於 六 趣 之 中"
            ),
            Verse(
                number: 73,
                text: "Through our body, speech, and mind, we were bound by desire, anger, and ignorance, thus committing various unwholesome deeds and creating limitless karmic obstacles.",
                pinyin: "yóu shì zì shēn kǒu yì zòng tān chēn chī miù zuò wàng wéi zào wú biān zhī yè zhàng",
                chinese: "由 是 恣 身 口 意 ‧ 縱 貪 瞋 癡 。 謬 作 妄 為 ‧ 造 無 邊 之 業 障"
            ),
            Verse(
                number: 74,
                text: "We followed falsity and evil, giving rise to many kinds of transgressions.",
                pinyin: "suí xié zhú è qǐ duō zhǒng zhī qiān yóu",
                chinese: "隨 邪 逐 惡 ‧ 起 多 種 之 愆 尤"
            ),
            Verse(
                number: 75,
                text: "Thus, the Tathāgata proclaimed a teaching of expedient means. We now sincerely repent and reform by relying on the pure assembly and reciting this efficacious text to cleanse our transgressions and adorn ourselves with pure precepts.",
                pinyin: "gù rú lái qǐ fāng biàn zhī jiào mén rán wǒ děng tóu chéng ér chàn huǐ yǎng píng qīng zhòng pī sòng líng wén xǐ dí qiān yóu zī yán jìng jiè",
                chinese: "故 如 來 啓 方 便 之 教 門 ‧ 然 我 等 投 誠 而 懺 悔 。 仰 憑 清 衆 ‧ 披 誦 靈 文 ‧ 洗 滌 愆 尤 ‧ 資 嚴 淨 戒"
            ),
            Verse(
                number: 76,
                text: "These are our vows and the Buddha will surely empathize with us. We sincerely prostrate to the One of Great Compassion, invisibly imbuing us with supportive aid!",
                pinyin: "wǒ yuàn rú sī fó bì āi lián kěn kòu hóng cí míng xūn jiā bèi",
                chinese: "我 願 如 斯 ‧ 佛 必 哀 憐 ‧ 懇 叩 洪 慈 ‧ 冥 熏 加 被"
            ),
            Verse(
                number: 77,
                text: "Homage to our teacher, Śākyamuni Buddha!",
                pinyin: "▲ ná mó běn shī shì jiā móu ní fó (3x)",
                chinese: "南 無 本 師 釋 迦 牟 尼 佛"
            ),
            Verse(
                number: 78,
                text: "The unsurpassed, profound, and subtly wondrous Dharma, Is difficult to encounter in hundreds of thousands of myriad kalpas.",
                pinyin: "wú shàng shèn shēn wéi miào fǎ bǎi qiān wàn jié nán zāo yù",
                chinese: "無 上 甚 深 微 妙 法 ‧ 百 千 萬 劫 難 遭 遇"
            ),
            Verse(
                number: 79,
                text: "Today we see, hear, receive, and uphold it, Vowing to understand the Tathāgata's true meaning!",
                pinyin: "wǒ jīn jiàn wén dé shòu chí yuàn jiě rú lái zhēn shí yì",
                chinese: "我 今 見 聞 得 受 持 ‧ 願 解 如 來 眞 實 義"
            ),
            Verse(
                number: 80,
                text: "Water Repentance of Kindness and Compassion – Scroll One",
                pinyin: "● cí bēi shuǐ chàn fǎ juàn shàng",
                chinese: "慈 悲 水 懺 法 卷 上"
            ),
            Verse(
                number: 81,
                text: "All buddhas are compassionately mindful of sentient beings and teach the Compiled Method of the Water Repentance Sanctuary of Awakening on our behalf.",
                pinyin: "yí qiè zhū fó mǐn niàn zhòng shēng wèi shuō shuǐ chàn dào chǎng zǒng fǎ",
                chinese: "一 切 諸 佛 ‧ 愍 念 衆 生 ‧ 為 說 水 懺 道 場 總 法"
            ),
            Verse(
                number: 82,
                text: "Because the defilements of sentient beings are heavy, who is without transgression? Who is without affliction?",
                pinyin: "liáng yǐ zhòng shēng gòu zhòng hé rén wú zuì hé zhě wú qiān",
                chinese: "良 以 衆 生 垢 重 ‧ 何 人 無 罪 ‧ 何 者 無 愆"
            ),
            Verse(
                number: 83,
                text: "The ignorant practices of us unenlightened beings are concealed by our own lack of wisdom.",
                pinyin: "fán fū yú xíng wú míng àn fù",
                chinese: "凡 夫 愚 行 ‧ 無 明 闇 覆"
            ),
            Verse(
                number: 84,
                text: "We associated with evil friends, our minds were afflicted and disturbed,",
                pinyin: "qīn jìn è yǒu fán nǎo luàn xīn",
                chinese: "親 近 惡 友 ‧ 煩 惱 亂 心"
            ),
            Verse(
                number: 85,
                text: "we gave rise to [self-]nature without knowing, and we were lax and arrogant.",
                pinyin: "lì xìng wú zhī zì xīn zì shì",
                chinese: "立 性 無 知 ‧ 恣 心 自 恃"
            ),
            Verse(
                number: 86,
                text: "We did not have faith in the buddhas of the ten directions, nor did we have faith in the honored Dharma or the sacred Sangha.",
                pinyin: "bù xìn shí fāng zhū fó bù xìn zūn fǎ shèng sēng",
                chinese: "不 信 十 方 諸 佛 ‧ 不 信 尊 法 聖 僧"
            ),
            Verse(
                number: 87,
                text: "We were not filial to our parents and six kinds of relatives.",
                pinyin: "bù xiào fù mǔ liù qīn juàn shǔ",
                chinese: "不 孝 父 母 ‧ 六 親 眷 屬"
            ),
            Verse(
                number: 88,
                text: "At the prime of our lives, we were lax and arrogant.",
                pinyin: "shèng nián fang yì yǐ zì jiāo jù",
                chinese: "盛 年 放 逸 ‧ 以 自 憍 倨"
            ),
            Verse(
                number: 89,
                text: "We desired all wealth and treasures, desired all musical entertainment, and desired all sexual pleasures.",
                pinyin: "yú yí qiè cái bǎo yí qiè gē yuè yí qiè nǚ sè",
                chinese: "於 一 切 財 寶 ‧ 一 切 歌 樂 ‧ 一 切 女 色"
            ),
            Verse(
                number: 90,
                text: "Our minds gave rise to desire, and our thoughts gave rise to afflictions.",
                pinyin: "xīn shēng tān liàn yì qǐ fán nǎo",
                chinese: "心 生 貪 戀 ‧ 意 起 煩 惱"
            ),
            Verse(
                number: 91,
                text: "We associated with unvirtuous people and lusted for evil friends without knowing to repent and reform.",
                pinyin: "qīn jìn fēi shèng xiè xiá è yǒu bù zhī quān gé",
                chinese: "親 近 非 聖 ‧ 媟 狎 惡 友 ‧ 不 知 悛 革"
            ),
            Verse(
                number: 92,
                text: "Or, we killed all sentient beings,",
                pinyin: "huò fù shā hài yí qiè zhòng shēng",
                chinese: "或 復 殺 害 一 切 衆 生"
            ),
            Verse(
                number: 93,
                text: "or we consumed intoxicants and became deluded.",
                pinyin: "huò yǐn jiǔ hūn mí",
                chinese: "或 飲 酒 昏 迷"
            ),
            Verse(
                number: 94,
                text: "Lacking a mind of wisdom, we always opposed sentient beings and violated the precepts.",
                pinyin: "wú zhì huì xīn héng yǔ zhòng shēng zào nì pò jiè",
                chinese: "無 智 慧 心 。 恆 與 衆 生 ‧ 造 逆 破 戒"
            ),
            Verse(
                number: 95,
                text: "Today, we sincerely repent and reform for each and every one of these past offenses as well as the evils we are currently conducting.",
                pinyin: "guò qù zhū zuì xian zài zhòng è jīn rì zhì chéng xī jiē chàn huǐ",
                chinese: "過 去 諸 罪 ‧ 現 在 衆 惡 ‧ 今 日 至 誠 ‧ 悉 皆 懺 悔"
            ),
            Verse(
                number: 96,
                text: "Today, we sincerely repent and reform for all of these, not daring to commit any future transgressions.",
                pinyin: "wèi zuò zhī zuì bù gǎn gèng zuò",
                chinese: "未 作 之 罪 ‧ 不 敢 更 作"
            ),
            Verse(
                number: 97,
                text: "Today, your disciples in the assembly sincerely seek refuge in all buddhas of the ten directions, throughout the realms of empty space;",
                pinyin: "shì gù jīn rì zhì xīn guī yī shí fāng jǐn xū kōng jiè yí qiè zhū fó",
                chinese: "是 故 今 日 ‧ 至 心 皈 依 ‧ 十 方 盡 虛 空 界 ‧ 一 切 諸 佛"
            ),
            Verse(
                number: 98,
                text: "the great bodhisattvas, pratyekabuddhas, arhats, and those of the Four Fruitions and Four Progressions;",
                pinyin: "zhū dà pú sà pì zhī luó hàn",
                chinese: "諸 大 菩 薩 ‧ 辟 支 羅 漢"
            ),
            Verse(
                number: 99,
                text: "King Brāhma and Emperor Śakra; the Eightfold Division of Devas and Nagas; and the entirety of the sacred assembly, praying for their presence and witness!",
                pinyin: "fàn wáng dì shì tiān lóng bā bù yí qiè shèng zhòng yuàn chuí zhèng jiàn",
                chinese: "梵 王 帝 釋 ‧ 天 龍 八 部 ‧ 一 切 聖 衆 ‧ 願 垂 證 鑑"
            ),
            Verse(
                number: 100,
                text: "Homage to Vairocana Buddha",
                pinyin: "ná mó pí lú zhē nà fó",
                chinese: "南 無 毗 盧 遮 那 佛"
            ),
            Verse(
                number: 101,
                text: "Homage to our teacher Śākyamuni Buddha",
                pinyin: "ná mó běn shī shì jiā móu ní fó",
                chinese: "南 無 本 師 釋 迦 牟 尼 佛"
            ),
            Verse(
                number: 102,
                text: "Homage to Amitābha Buddha",
                pinyin: "ná mó ē mí tuó fó",
                chinese: "南 無 阿 彌 陀 佛"
            ),
            Verse(
                number: 103,
                text: "Homage to Maitreya Buddha",
                pinyin: "ná mó mí lè fó",
                chinese: "南 無 彌 勒 佛"
            ),
            Verse(
                number: 104,
                text: "Homage to Nāgagotrodārajñānarāja Buddha",
                pinyin: "ná mó lóng zhǒng shàng zūn wáng fó",
                chinese: "南 無 龍 種 上 尊 王 佛"
            ),
            Verse(
                number: 105,
                text: "Homage to Nāgeśvararāja Buddha",
                pinyin: "ná mó lóng zì zài wáng fó",
                chinese: "南 無 龍 自 在 王 佛"
            ),
            Verse(
                number: 106,
                text: "Homage to Prabhūtaratna Buddha",
                pinyin: "ná mó bǎo shèng fó",
                chinese: "南 無 寶 勝 佛"
            ),
            Verse(
                number: 107,
                text: "Homage to Buddhapuṇḍarīkadhyaneśvararāja Buddha",
                pinyin: "ná mó jué huá dìng zì zài wáng fó",
                chinese: "南 無 覺 華 定 自 在 王 佛"
            ),
            Verse(
                number: 108,
                text: "Homage to Kasayadhvaja Buddha",
                pinyin: "ná mó jiā shā chuáng fó",
                chinese: "南 無 袈 裟 幢 佛"
            ),
            Verse(
                number: 109,
                text: "Homage to Siṃhanāda Buddha",
                pinyin: "ná mó shī zi hǒu fó",
                chinese: "南 無 師 子 吼 佛"
            ),
            Verse(
                number: 110,
                text: "Homage to Mañjuśrī Bodhisattva",
                pinyin: "ná mó wén shū shī lì pú sà",
                chinese: "南 無 文 殊 師 利 菩 薩"
            ),
            Verse(
                number: 111,
                text: "Homage to Samantabhadra Bodhisattva",
                pinyin: "ná mó pǔ xián pú sà",
                chinese: "南 無 普 賢 菩 薩"
            ),
            Verse(
                number: 112,
                text: "Homage to Mahāsthāmaprāpta Bodhisattva",
                pinyin: "ná mó dà shì zhì pú sà",
                chinese: "南 無 大 勢 至 菩 薩"
            ),
            Verse(
                number: 113,
                text: "Homage to Kṣitigarbha Bodhisattva",
                pinyin: "ná mó dì zàng pú sà",
                chinese: "南 無 地 藏 菩 薩"
            ),
            Verse(
                number: 114,
                text: "Homage to Mahāvyūha Bodhisattva",
                pinyin: "ná mó dà zhuāng yán pú sà",
                chinese: "南 無 大 莊 嚴 菩 薩"
            ),
            Verse(
                number: 115,
                text: "Homage to Avalokiteśvara Bodhisattva",
                pinyin: "ná mó guān zì zài pú sà",
                chinese: "南 無 觀 自 在 菩 薩"
            ),
            Verse(
                number: 116,
                text: "Having prostrated to the buddhas, again, repent and reform.",
                pinyin: "● lǐ zhū fó yǐ cì fù chàn huǐ",
                chinese: "禮 諸 佛 已 ‧ 次 復 懺 悔"
            ),
            Verse(
                number: 117,
                text: "When one wishes to repent, it is necessary to first venerate the Triple Gem.",
                pinyin: "fú yù lǐ chàn bì xū xiān jìng sān bǎo",
                chinese: "夫 欲 禮 懺 ‧ 必 須 先 敬 三 寶"
            ),
            Verse(
                number: 118,
                text: "This is because the Triple Gem is a virtuous friend and field of merit for all sentient beings.",
                pinyin: "suǒ yǐ rán zhě sān bǎo jí shì yí qiè zhòng shēng liáng yǒu fú tián",
                chinese: "所 以 然 者 。 三 寶 卽 是 一 切 衆 生 ‧ 良 友 福 田"
            ),
            Verse(
                number: 119,
                text: "If one can seek refuge in it, then one can eradicate limitless transgressions and gain limitless blessings.",
                pinyin: "ruò néng guī xiàng zhě zé miè wú liàng zuì zhǎng wú liàng fú",
                chinese: "若 能 歸 向 者 ‧ 則 滅 無 量 罪 ‧ 長 無 量 福"
            ),
            Verse(
                number: 120,
                text: "It can cause the practitioner to be free from the suffering of birth and death and obtain the joy of liberation.",
                pinyin: "néng lìng xíng zhě lí shēng sǐ kǔ dé jiě tuō lè",
                chinese: "能 令 行 者 ‧ 離 生 死 苦 ‧ 得 解 脫 樂"
            ),
            Verse(
                number: 121,
                text: "Thus, your disciples in the assembly seek refuge in all Buddhas of the ten directions, throughout the realms of empty space;",
                pinyin: "shì gù guī yī shí fāng jìn xū kōng jiè yí qiè zhū fó",
                chinese: "是 故 皈 依 十 方 盡 虛 空 界 ‧ 一 切 諸 佛"
            ),
            Verse(
                number: 122,
                text: "seek refuge in all honored Dharmas of the ten directions, throughout the realms of empty space;",
                pinyin: "guī yī shí fāng jìn xū kōng jiè yí qiè zūn fǎ",
                chinese: "皈 依 十 方 盡 虛 空 界 ‧ 一 切 尊 法"
            ),
            Verse(
                number: 123,
                text: "and seek refuge in all sacred Sanghas of the ten directions, throughout the realms of empty space!",
                pinyin: "guī yī shí fāng jìn xū kōng jiè yí qiè shèng sēng",
                chinese: "皈 依 十 方 盡 虛 空 界 ‧ 一 切 聖 僧"
            )
        ]
        for verse in waterChapter3.verses {
            verse.chapter = waterChapter3
        }
        
        // MARK: Water Repentance - Chapter 4: The Seven Kinds of Mind
        let waterChapter4 = Chapter(number: 4, title: "The Seven Kinds of Mind")
        waterChapter4.text = waterRepentance
        waterChapter4.verses = [
            Verse(
                number: 1,
                text: "Today, we, your disciples, are repenting and reforming precisely because since beginningless time, we have been at the stage of ordinary beings.",
                pinyin: "zhòng děng jīn rì suǒ yǐ chàn huǐ zhě zhèng wéi wú shǐ yǐ lái zài fán fū dì",
                chinese: "某 等 今 日 所 以 懺 悔 者 ‧ 正 為 無 始 以 來 ‧ 在 凡 夫 地"
            ),
            Verse(
                number: 2,
                text: "Regardless of class and status, our offenses are limitless.",
                pinyin: "mò wèn guì jiàn zuì xiàng wú liàng",
                chinese: "莫 問 貴 賤 ‧ 罪 相 無 量"
            ),
            Verse(
                number: 3,
                text: "Whether these offenses were born from our Three Karmas or rose from our Six Faculties;",
                pinyin: "huò yīn sān yè ér shēng zuì huò cóng liù gēn ér qǐ guò",
                chinese: "或 因 三 業 而 生 罪 ‧ 或 從 六 根 而 起 過"
            ),
            Verse(
                number: 4,
                text: "whether these were internal—born of our deviant thoughts, or external—created from various defilements;",
                pinyin: "huò yǐ nèi xīn zì xié sī wéi huò jiè wài jìng qǐ zhū rǎn zhuó",
                chinese: "或 以 內 心 自 邪 思 惟 ‧ 或 藉 外 境 ‧ 起 諸 染 著"
            ),
            Verse(
                number: 5,
                text: "the Ten Unwholesome Deeds grew in this way to become the Eighty-Four Thousand Gates of Affliction.",
                pinyin: "rú shì nǎi zhì shí è zēng zhǎng bā wàn sì qiān zhū chén láo mén",
                chinese: "如 是 乃 至 十 惡 ‧ 增 長 八 萬 四 千 諸 塵 勞 門"
            ),
            Verse(
                number: 6,
                text: "Though these offenses are limitless, described in general, they fall under three categories without exception.",
                pinyin: "rán qí zuì xiàng suī fù wú liàng dà ér wéi yǔ bù chū yǒu sān",
                chinese: "然 其 罪 相 ‧ 雖 復 無 量 ‧ 大 而 為 語 ‧ 不 出 有 三"
            ),
            Verse(
                number: 7,
                text: "First are afflictions, second is karma, and third is result.",
                pinyin: "yī zhě fán nǎo èr zhě shì yè sān zhě guǒ bào",
                chinese: "一 者 煩 惱 ‧ 二 者 是 業 ‧ 三 者 果 報"
            ),
            Verse(
                number: 8,
                text: "These three phenomena can obstruct the sagely path and the wondrous affairs among humans and devas.",
                pinyin: "cǐ sān zhǒng fǎ néng zhàng shèng dào jí yǐ rén tiān shèng miào hǎo shì",
                chinese: "此 三 種 法 ‧ 能 障 聖 道 ‧ 及 以 人 天 勝 妙 好 事"
            ),
            Verse(
                number: 9,
                text: "Therefore, the sūtras catalog these as the Three Obstructions.",
                pinyin: "shì gù jīng zhōng mù wèi sān zhàng",
                chinese: "是 故 經 中 ‧ 目 為 三 障"
            ),
            Verse(
                number: 10,
                text: "Thus, the buddhas and bodhisattvas teach the expedient means of repentance and reformation",
                pinyin: "suǒ yǐ zhū fó pú sà jiào zuò fāng biàn chàn huǐ chú miè",
                chinese: "所 以 諸 佛 菩 薩 ‧ 教 作 方 便 ‧ 懺 悔 除 滅"
            ),
            Verse(
                number: 11,
                text: "to eradicate these Three Obstructions and cause the Six Faculties, Ten Unwholesome Deeds, and even the Eighty-Four Thousand Gates of Affliction to all be pure.",
                pinyin: "cǐ sān zhàng miè zé liù gēn shí è nǎi zhì bā wàn sì qiān zhū chén láo mén jiē xī qīng jìng",
                chinese: "此 三 障 滅 ‧ 則 六 根 十 惡 ‧ 乃 至 八 萬 四 千 諸 塵 勞 門 ‧ 皆 悉 清 淨"
            ),
            Verse(
                number: 12,
                text: "Therefore, your disciples in the assembly repent and reform for the Three Obstructions today with the supreme mind of improvement.",
                pinyin: "shì gù zhòng děng jīn rì yùn cǐ zēng shàng shèng xīn chàn huǐ sān zhàng",
                chinese: "是 故 某 等 ‧ 今 日 運 此 增 上 勝 心 ‧ 懺 悔 三 障"
            ),
            Verse(
                number: 13,
                text: "For those who wish to eradicate the Three Obstructions, what kind of mindset should one use that can cause these obstructions to be eradicated?",
                pinyin: "yù miè sān zhàng zhě dāng yòng hé děng xīn kě lìng cǐ zhàng miè chú",
                chinese: "欲 滅 三 障 者 ‧ 當 用 何 等 心 ‧ 可 令 此 障 滅 除"
            ),
            Verse(
                number: 14,
                text: "First, one should give rise to the Seven Kinds of Mind as expedient means.",
                pinyin: "xiān dāng xīng qī zhǒng xīn yǐ wéi fāng biàn",
                chinese: "先 當 興 七 種 心 ‧ 以 為 方 便"
            ),
            Verse(
                number: 15,
                text: "Then these obstructions can be eradicated.",
                pinyin: "rán hòu cǐ zhàng nǎi kě dé miè",
                chinese: "然 後 此 障 ‧ 乃 可 得 滅"
            ),
            Verse(
                number: 16,
                text: "What are these seven?",
                pinyin: "hé děng wéi qī",
                chinese: "何 等 為 七"
            ),
            Verse(
                number: 17,
                text: "First is remorse and shame, second is fear, third is dispassion, fourth is to give rise to the bodhi mind, fifth is seeing friends and foes as equal, six is be mindful of and repay the Buddha's kindness, and seventh is contemplating the empty nature of transgressions.",
                pinyin: "yī zhě cán kuì èr zhě kǒng bù sān zhě yàn lí sì zhě fā pú tí xīn wǔ zhě yuàn qīn píng děng liù zhě niàn bào fó ēn qī zhě guān zuì xìng kōng",
                chinese: "一 者 慚 愧 ‧ 二 者 恐 怖 ‧ 三 者 厭 離 ‧ 四 者 發 菩 提 心 ‧ 五 者 怨 親 平 等 ‧ 六 者 念 報 佛 恩 ‧ 七 者 觀 罪 性 空"
            ),
            Verse(
                number: 18,
                text: "Regarding the first mind of remorse and shame, one should think: Śākyamuṇi Tathāgata and I were both originally ordinary beings,",
                pinyin: "dì yī cán kuì zhě zì wéi wǒ yǔ shì jiā rú lái tóng wèi fán fū",
                chinese: "第 一 慚 愧 者 。 自 惟 我 與 釋 迦 如 來 同 為 凡 夫"
            ),
            Verse(
                number: 19,
                text: "but the World-Honored One has attained awakening for innumerable kalpas numbering grains of dust and sand",
                pinyin: "ér jīn shì zūn chéng dào yǐ lái yǐ jīng ěr suǒ chén shā jié shù",
                chinese: "而 今 世 尊 成 道 以 來 ‧ 已 經 爾 所 塵 沙 劫 數"
            ),
            Verse(
                number: 20,
                text: "while we still indulge in the defilements of the Six Dusts and eternally tumble in the cycle of birth and death without any end in sight.",
                pinyin: "ér wǒ děng xiāng yǔ dān rǎn liù chén yǒng wú lún zhuǎn shēng sǐ wú chū qí",
                chinese: "而 我 等 相 與 耽 染 六 塵 ‧ 輪 轉 生 死 ‧ 永 無 出 期"
            ),
            Verse(
                number: 21,
                text: "This is truly a matter in this world which is remorseful, shameful, embarrassing, and disgraceful.",
                pinyin: "cǐ shí tiān xià kě cán kě kuì kě xiū kě chǐ",
                chinese: "此 實 天 下 ‧ 可 慚 可 愧 ‧ 可 羞 可 恥"
            ),
            Verse(
                number: 22,
                text: "Regarding the second mind of fear, the physical, verbal, and mental karma of ordinary beings is always resonating with offenses.",
                pinyin: "dì èr kǒng bù zhě jì shì fán fū shēn kǒu yì yè cháng yǔ zuì xiāng yìng",
                chinese: "第 二 恐 怖 者 。 既 是 凡 夫 ‧ 身 口 意 業 ‧ 常 與 罪 相 應"
            ),
            Verse(
                number: 23,
                text: "Through these causes and conditions, at the end of our lives, we should descend into the realms of hell, animals, and hungry ghosts to endure limitless suffering.",
                pinyin: "yǐ shì yīn yuán mìng zhōng zhī hòu yīng duò dì yù chù shēng è guǐ shòu wú liàng kǔ",
                chinese: "以 是 因 緣 ‧ 命 終 之 後 ‧ 應 墮 地 獄 ‧ 畜 生 餓 鬼 ‧ 受 無 量 苦"
            ),
            Verse(
                number: 24,
                text: "This is truly startling, frightening, terrifying, and fearsome.",
                pinyin: "rú cǐ shí wèi kě jīng kě kǒng kě bù kě jù",
                chinese: "如 此 實 為 可 驚 可 恐 ‧ 可 怖 可 懼"
            ),
            Verse(
                number: 25,
                text: "Regarding the third mind of dispassion, we should always observe that within birth and death, there is only impermanence, suffering, emptiness, non-self, impurities, and false forms which resemble bubbles in the water—suddenly appearing and suddenly disappearing.",
                pinyin: "dì sān yàn lí zhě xiāng yǔ cháng guān shēng sǐ zhī zhōng wéi yǒu wú cháng kǔ kōng wú wǒ bú jìng xū jiǎ rú shuǐ shàng pào sù qǐ sù miè",
                chinese: "第 三 厭 離 者 。 相 與 常 觀 ‧ 生 死 之 中 惟 有 無 常 苦 空 無 我 ‧ 不 淨 虛 假 。 如 水 上 泡 ‧ 速 起 速 滅"
            ),
            Verse(
                number: 26,
                text: "Since the distant past, we have cycled through [birth and death] like a cart's wheel, undergoing birth, old age, sickness, and death and the burns of the Eight Sufferings without any moment of pause.",
                pinyin: "wǎng lái liú zhuǎn yóu rú chē lún shēng lǎo bìng sǐ bā kǔ jiāo jiān wú shí zàn xí",
                chinese: "往 來 流 轉 ‧ 猶 如 車 輪 。 生 老 病 死 ‧ 八 苦 交 煎 ‧ 無 時 暫 息"
            ),
            Verse(
                number: 27,
                text: "We, the assembly, only see our bodies—from head to toe—as only having thirty-six parts:",
                pinyin: "zhòng děng xiāng yǔ dàn guān zì shēn cóng tóu zhì zú qí zhōng dàn yǒu sān shí liù wù",
                chinese: "衆 等 相 與 ‧ 但 觀 自 身 ‧ 從 頭 至 足 ‧ 其 中 但 有 三 十 六 物"
            ),
            Verse(
                number: 28,
                text: "head hair, body hair, nails, teeth, eye crust, tears, saliva, filth, sweat, urine, feces, skin, tissue, blood, flesh, tendons, veins & arteries, bone, marrow, fat, grease, brain, membrane, kidneys, heart, lung, liver, large intestine, small intestine, red phlegm, white phlegm, stomach, and bowels.",
                pinyin: "fǎ máo zhuǎ chǐ chī lèi tì tuò gòu hàn èr biàn pí fū xiě ròu jīn mài gǔ suǐ fáng gāo nǎo mó pí shèn xīn fèi gān dǎn cháng wèi chì bái tán yìn shēng shú èr zàng",
                chinese: "髮 毛 爪 齒 ‧ 眵 淚 涕 唾 ‧ 垢 汗 二 便 ‧ 皮 膚 血 肉 ‧ 筋 脈 骨 髓 ‧ 肪 膏 腦 膜 ‧ 脾 腎 心 肺 ‧ 肝 膽 腸 胃 ‧ 赤 白 痰 癊 ‧ 生 熟 二 臟"
            ),
            Verse(
                number: 29,
                text: "In this way, the Nine Orifices constantly flow.",
                pinyin: "rú shì jiǔ kǒng cháng liú",
                chinese: "如 是 九 孔 常 流"
            ),
            Verse(
                number: 30,
                text: "Thus, the sūtras state that this body is formed through a collection of sufferings and all of it is impure.",
                pinyin: "shì gù jīng yán cǐ shēn zhòng kǔ suǒ jí yí qiè jiē shì bú jìng",
                chinese: "是 故 經 言 ‧ 此 身 衆 苦 所 集 ‧ 一 切 皆 是 不 淨"
            ),
            Verse(
                number: 31,
                text: "How could there be a wise person who relishes this body?",
                pinyin: "hé yǒu zhì huì zhě ér dāng yào cǐ shēn",
                chinese: "何 有 智 慧 者 ‧ 而 當 樂 此 身"
            ),
            Verse(
                number: 32,
                text: "Birth and death are comprised of such unwholesome phenomena and should be regarded with loathing and dispassion.",
                pinyin: "shēng sǐ jì yǒu rú cǐ zhǒng zhǒng è fǎ shén kě huàn yàn",
                chinese: "生 死 既 有 如 此 種 種 惡 法 ‧ 甚 可 患 厭"
            ),
            Verse(
                number: 33,
                text: "Regarding the fourth mind of giving rise to the bodhi mind, the sūtras state that one should seek the Buddha's body, which is the Dharma body.",
                pinyin: "dì sì fā pú tí xīn zhě jīng yán dāng yào fó shēn fó shēn zhě jí fǎ shēn yě",
                chinese: "第 四 發 菩 提 心 者 。 經 言 ‧ 當 樂 佛 身 。 佛 身 者 ‧ 卽 法 身 也"
            ),
            Verse(
                number: 34,
                text: "It is born through limitless merits and virtues as well as wisdom.",
                pinyin: "cóng wú liàng gōng dé zhì huì shēng",
                chinese: "從 無 量 功 德 智 慧 生"
            ),
            Verse(
                number: 35,
                text: "It is born through the Six Pāramitās.",
                pinyin: "cóng liù bō luó mì shēng",
                chinese: "從 六 波 羅 蜜 生"
            ),
            Verse(
                number: 36,
                text: "It is born through kindness, compassion, joy, and equanimity.",
                pinyin: "cóng cí bēi xǐ shě shēng",
                chinese: "從 慈 悲 喜 捨 生"
            ),
            Verse(
                number: 37,
                text: "It is born through the Thirty-Seven Factors of Awakening.",
                pinyin: "cóng sān shí qī zhù pú tí fǎ shēng",
                chinese: "從 三 十 七 助 菩 提 法 生"
            ),
            Verse(
                number: 38,
                text: "The tathāgata's body is born through all of these merits and virtues as well as wisdom.",
                pinyin: "cóng rú shì děng zhǒng zhǒng gōng dé zhì huì shēng rú lái shēn",
                chinese: "從 如 是 等 ‧ 種 種 功 德 智 慧 生 如 來 身"
            ),
            Verse(
                number: 39,
                text: "One who wishes to obtain this body should give rise to the bodhi mind and seek omniscience;",
                pinyin: "yù dé cǐ shēn zhě dāng fā pú tí xīn qiú yí qiè zhǒng zhì",
                chinese: "欲 得 此 身 者 ‧ 當 發 菩 提 心 ‧ 求 一 切 種 智"
            ),
            Verse(
                number: 40,
                text: "permanence, bliss, self-nature, and purity; the fruit of sarvajña;",
                pinyin: "cháng lè wǒ jìng sà pó ruò guǒ",
                chinese: "常 樂 我 淨 ‧ 薩 婆 若 果"
            ),
            Verse(
                number: 41,
                text: "purify the buddha's land; assist sentient beings; and not be attached to one's body, life, and possessions.",
                pinyin: "jìng fó guó tǔ chéng jiù zhòng shēng yú shēn mìng cái wú suǒ lìn xí",
                chinese: "淨 佛 國 土 ‧ 成 就 衆 生 。 於 身 命 財 ‧ 無 所 吝 惜"
            ),
            Verse(
                number: 42,
                text: "Regarding the fifth mind of seeing friends and foes as equal, one should give rise to a mind of compassion towards all sentient beings without differentiating between self and other.",
                pinyin: "dì wǔ yuàn qīn píng děng zhě yú yí qiè zhòng shēng qǐ cí bēi xīn wú bǐ wǒ xiàng",
                chinese: "第 五 怨 親 平 等 者 。 於 一 切 衆 生 ‧ 起 慈 悲 心 ‧ 無 彼 我 相"
            ),
            Verse(
                number: 43,
                text: "Why is this? If one sees friends different from foes, then that is discriminating.",
                pinyin: "hé yǐ gù ěr ruò jiàn yuàn yì yú qīn jí shì fēn bié",
                chinese: "何 以 故 爾 。 若 見 怨 異 於 親 ‧ 卽 是 分 別"
            ),
            Verse(
                number: 44,
                text: "Because of this discrimination, attachment to form arises.",
                pinyin: "yǐ fēn bié gù qǐ zhū xiàng zhuó",
                chinese: "以 分 別 故 ‧ 起 諸 相 著"
            ),
            Verse(
                number: 45,
                text: "This attachment to form leads to the causes and conditions for afflictions to arise.",
                pinyin: "xiàng zhuó yīn yuán shēng zhū fán nǎo",
                chinese: "相 著 因 緣 ‧ 生 諸 煩 惱"
            ),
            Verse(
                number: 46,
                text: "Afflictions are the causes and conditions for unwholesome karma,",
                pinyin: "fán nǎo yīn yuán zào zhū è yè",
                chinese: "煩 惱 因 緣 ‧ 造 諸 惡 業"
            ),
            Verse(
                number: 47,
                text: "and unwholesome karma forms the causes and conditions for the fruition of suffering.",
                pinyin: "è yè yīn yuán gù dé kǔ guǒ",
                chinese: "惡 業 因 緣 ‧ 故 得 苦 果"
            ),
            Verse(
                number: 48,
                text: "Regarding the sixth mind of repaying the buddha's kindness, in limitless kalpas past, the Tathāgata offered his head, eyes, marrow, brain, limbs, hands, and feet;",
                pinyin: "dì liù niàn bào fó ēn zhě rú lái wǎng xí wú liàng jié zhōng shě tóu mù suǐ nǎo zhī jié shǒu zú",
                chinese: "第 六 念 報 佛 恩 者 。 如 來 往 昔 無 量 劫 中 ‧ 捨 頭 目 髓 腦 ‧ 支 節 手 足"
            ),
            Verse(
                number: 49,
                text: "his nation and kingdom; his wife and children; his elephant, steed, and Seven Treasures.",
                pinyin: "guó chéng qī zǐ xiàng mǎ qī zhēn",
                chinese: "國 城 妻 子 ‧ 象 馬 七 珍"
            ),
            Verse(
                number: 50,
                text: "On our behalf, he practiced austerities. This kindness and virtue is truly difficult to repay.",
                pinyin: "wèi wǒ děng gù xiū zhū kǔ hèng cǐ ēn cǐ dé shí nán chóu bào",
                chinese: "為 我 等 故 ‧ 修 諸 苦 行 。 此 恩 此 德 ‧ 實 難 酬 報"
            ),
            Verse(
                number: 51,
                text: "Thus, the sūtra states, 'Even if one were to bear him on one's head and shoulders out of deep respect, for as many kalpas as there are grains of sand in the Ganges River, one could not repay him.'",
                pinyin: "shì gù jīng yán ruò yǐ dǐng dài liǎng jiān hé fù yú héng shā jié yì bù néng bào",
                chinese: "是 故 經 言 ‧ 若 以 頂 戴 ‧ 兩 肩 荷 負 ‧ 於 恆 沙 劫 ‧ 亦 不 能 報"
            ),
            Verse(
                number: 52,
                text: "We, who wish to repay this kindness, should be courageous and diligent in this lifetime;",
                pinyin: "wǒ děng yù bào rú lái ēn zhě dāng yú cǐ shì yǒng měng jīng jìn",
                chinese: "我 等 欲 報 如 來 恩 者 ‧ 當 於 此 世 ‧ 勇 猛 精 進"
            ),
            Verse(
                number: 53,
                text: "work hard and endure suffering, unconcerned with our body and life;",
                pinyin: "hàn láo rěn kǔ bù xí shēn mìng",
                chinese: "捍 勞 忍 苦 ‧ 不 惜 身 命"
            ),
            Verse(
                number: 54,
                text: "establish the Triple Gem and propagate the Mahāyāna;",
                pinyin: "jiàn lì sān bǎo hóng tōng dà chèng",
                chinese: "建 立 三 寶 ‧ 弘 通 大 乘"
            ),
            Verse(
                number: 55,
                text: "and transform sentient beings so that all attain Proper Awakening.",
                pinyin: "guǎng huà zhòng shēng tóng rù zhèng jué",
                chinese: "廣 化 衆 生 ‧ 同 入 正 覺"
            ),
            Verse(
                number: 56,
                text: "Regarding the seventh mind of contemplating the empty nature of transgressions, transgressions lack an inherent nature and lack the characteristics of reality.",
                pinyin: "dì qī guān zuì xìng kōng zhě zuì wú zì xìng wú yǒu shí xiàng",
                chinese: "第 七 觀 罪 性 空 者 。 罪 無 自 性 ‧ 無 有 實 相"
            ),
            Verse(
                number: 57,
                text: "They arise through causes and conditions. They exist through distortions.",
                pinyin: "cóng yīn yuán shēng diān dǎo ér yǒu",
                chinese: "從 因 緣 生 ‧ 顚 倒 而 有"
            ),
            Verse(
                number: 58,
                text: "Since they arise through causes and conditions, they also cease through causes and conditions.",
                pinyin: "jì cóng yīn yuán ér shēng yì cóng yīn yuán ér miè",
                chinese: "既 從 因 緣 而 生 ‧ 亦 從 因 緣 而 滅"
            ),
            Verse(
                number: 59,
                text: "They arise through causes and conditions such as lusting to be with evil friends and behaving improperly.",
                pinyin: "cóng yīn yuán ér shēng zhě xiá jìn è yǒu zào zuò wú duān",
                chinese: "從 因 緣 而 生 者 ‧ 狎 近 惡 友 ‧ 造 作 無 端"
            ),
            Verse(
                number: 60,
                text: "They cease through causes and conditions such as the repentance and reformation today, which cleanses our minds.",
                pinyin: "cóng yīn yuán ér miè zhě jí shì jīn rì xǐ xīn chàn huǐ",
                chinese: "從 因 緣 而 滅 者 ‧ 卽 是 今 日 洗 心 懺 悔"
            ),
            Verse(
                number: 61,
                text: "Therefore, the sūtras state that the nature of transgression is not internal, not external, and not in between.",
                pinyin: "shì gù jīng yán cǐ zuì xìng bù zài nèi bù zài wài bù zài zhōng jiān",
                chinese: "是 故 經 言 ‧ 此 罪 性 ‧ 不 在 內 ‧ 不 在 外 ‧ 不 在 中 間"
            ),
            Verse(
                number: 62,
                text: "Thus, we know that the transgressions are originally empty [in nature].",
                pinyin: "gù zhī cǐ zuì cóng běn shì kōng",
                chinese: "故 知 此 罪 ‧ 從 本 是 空"
            ),
            Verse(
                number: 63,
                text: "Having given rise to these Seven Kinds of Mind, next we contemplate the buddhas and worthy sages of the ten directions",
                pinyin: "shēng rú shì děng qī zhǒng xīn yǐ yuán xiǎng shí fāng zhū fó xián shèng",
                chinese: "生 如 是 等 ‧ 七 種 心 已 ‧ 緣 想 十 方 ‧ 諸 佛 賢 聖"
            ),
            Verse(
                number: 64,
                text: "and join our palms while admitting our [faults]. Filled with remorse and shame, we vow to change.",
                pinyin: "qíng quán hé zhǎng pī chén zhì dǎo cán kuì gǎi gé",
                chinese: "擎 拳 合 掌 ‧ 披 陳 致 禱 ‧ 慚 愧 改 革"
            ),
            Verse(
                number: 65,
                text: "Purifying our hearts and cleansing our insides, through this repentance and reformation, what offenses can remain unabolished? What merits are not born?",
                pinyin: "shū lì xīn gān xǐ dàng cháng wèi rú cǐ chàn huǐ hé zuì bú miè hé fú bù shēng",
                chinese: "舒 瀝 心 肝 ‧ 洗 蕩 腸 胃 。 如 此 懺 悔 ‧ 何 罪 不 滅 ‧ 何 福 不 生"
            ),
            Verse(
                number: 66,
                text: "If this is not the case, then one is either lax and unconcerned, or giving rise to agitated thoughts and emotions.",
                pinyin: "ruò fù bù ěr yōu yōu huǎn zòng qíng lǜ zào dòng",
                chinese: "若 復 不 爾 ‧ 悠 悠 緩 縱 ‧ 情 慮 躁 動"
            ),
            Verse(
                number: 67,
                text: "This is merely exhausting one's body. What benefit could there possibly be?",
                pinyin: "tú zì láo xíng yú shì hé yì",
                chinese: "徒 自 勞 形 ‧ 於 事 何 益"
            ),
            Verse(
                number: 68,
                text: "Furthermore, one's life is impermanent like a candle. If just one breath is missed, then one is the same as ashes and dust.",
                pinyin: "qiě fù rén mìng wú cháng yù rú zhuǎn zhú yì xí bù huán biàn tong huī rǎng",
                chinese: "且 復 人 命 無 常 ‧ 諭 如 轉 燭 ‧ 一 息 不 還 ‧ 便 同 灰 壤"
            ),
            Verse(
                number: 69,
                text: "The retribution of suffering in the Three Lower Realms are instantly on one's body, and no amount of money, treasure, or material possessions can provide an escape.",
                pinyin: "sān tú kǔ bào jí shēn yīng shòu bù kě yǐ qián cái bǎo huò zhǔ tuō qiú tuō",
                chinese: "三 塗 苦 報 ‧ 卽 身 應 受 。 不 可 以 錢 財 寶 貨 ‧ 囑 託 求 脫"
            ),
            Verse(
                number: 70,
                text: "Somber and dark, there is no benevolent pardon, nor anybody to undergo these sufferings on one's behalf.",
                pinyin: "yǎo yǎo míng míng ēn shè wú qī dú yīng cǐ kǔ wú dài shòu zhě",
                chinese: "窈 窈 冥 冥 ‧ 恩 赦 無 期 。 獨 嬰 此 苦 ‧ 無 代 受 者"
            ),
            Verse(
                number: 71,
                text: "Do not say, 'I have not committed these transgressions in this life, and so I cannot sincerely repent and reform.'",
                pinyin: "mò yán wǒ jīn shēng zhōng wú yǒu cǐ zuì suǒ yǐ bù néng kěn dǎo chàn huǐ",
                chinese: "莫 言 我 今 生 中 ‧ 無 有 此 罪 ‧ 所 以 不 能 懇 禱 懺 悔"
            ),
            Verse(
                number: 72,
                text: "The sūtras state that when ordinary beings even raise their foot and take a step, are all transgressions.",
                pinyin: "jīng zhōng wèi yán fán fū zhī rén jǔ zú dòng bù wú fēi shì zuì",
                chinese: "經 中 謂 言 ‧ 凡 夫 之 人 ‧ 舉 足 動 步 ‧ 無 非 是 罪"
            ),
            Verse(
                number: 73,
                text: "Furthermore, in past lives, we have all committed limitless unwholesome deeds which follow us like a shadow and its form.",
                pinyin: "yòu fù guò qù shēng zhōng jiē xī chéng jiù wú liàng è yè zhuī zhú xíng zhě rú yǐng suí xíng",
                chinese: "又 復 過 去 生 中 ‧ 皆 悉 成 就 無 量 惡 業 ‧ 追 逐 行 者 如 影 隨 形"
            ),
            Verse(
                number: 74,
                text: "If we do not repent and reform, these transgressions and evils will increase day by day.",
                pinyin: "ruò bú chàn huǐ zuì è rì shēn",
                chinese: "若 不 懺 悔 ‧ 罪 惡 日 深"
            ),
            Verse(
                number: 75,
                text: "Thus, know that the Buddha did not permit concealing one's flaws. Instead, confess one's past transgressions as the Vimalakirti Sūtra teaches.",
                pinyin: "gù zhī bāo cáng xiá cǐ fó bù xǔ kě shuō huǐ xiān zuì jìng míng suǒ shàng",
                chinese: "故 知 包 藏 瑕 玼 ‧ 佛 不 許 可 。 說 悔 先 罪 ‧ 淨 名 所 尚"
            ),
            Verse(
                number: 76,
                text: "Therefore, drifting in the Sea of Suffering is precisely because of concealing [one's transgressions].",
                pinyin: "gù shǐ cháng lún kǔ hǎi shí yǒu yǐn fù",
                chinese: "故 使 長 淪 苦 海 ‧ 實 有 隱 覆"
            ),
            Verse(
                number: 77,
                text: "Thus, we, your disciples, confess as well as repent and reform for all transgressions today without concealing them any further.",
                pinyin: "shì gù zhòng děng jīn rì fā lù chàn huǐ bú fù fù cáng",
                chinese: "是 故 某 等 今 日 發 露 懺 悔 ‧ 不 復 覆 藏"
            )
        ]
        for verse in waterChapter4.verses {
            verse.chapter = waterChapter4
        }
        
        // MARK: Water Repentance - Chapter 5: Repentance of Afflictions
        let waterChapter5 = Chapter(number: 5, title: "Repentance of Afflictions")
        waterChapter5.text = waterRepentance
        waterChapter5.verses = [
            Verse(
                number: 1,
                text: "Of the Three Obstructions, the first is affliction, the second is karma, and the third is result.",
                pinyin: "suǒ yán sān zhàng zhě yī yuē fán nǎo èr míng wèi yè sān shì guǒ bào",
                chinese: "所 言 三 障 者 。 一 曰 煩 惱 ‧ 二 名 為 業 ‧ 三 是 果 報"
            ),
            Verse(
                number: 2,
                text: "These three phenomena mutually lead to each other.",
                pinyin: "cǐ sān zhǒng fǎ gèng xiāng yóu jiè",
                chinese: "此 三 種 法 ‧ 更 相 由 藉"
            ),
            Verse(
                number: 3,
                text: "Because of afflictions, unwholesome karma arises.",
                pinyin: "yīn fán nǎo gù suǒ yǐ qǐ zhū è yè",
                chinese: "因 煩 惱 故 ‧ 所 以 起 諸 惡 業"
            ),
            Verse(
                number: 4,
                text: "Because of unwholesome karma, one obtains suffering as a result.",
                pinyin: "è yè yīn yuán gù dé kǔ guǒ",
                chinese: "惡 業 因 緣 ‧ 故 得 苦 果"
            ),
            Verse(
                number: 5,
                text: "Thus, your disciples in the assembly sincerely repent and reform today.",
                pinyin: "shì gù zhòng děng jīn rì zhì xīn chàn huǐ",
                chinese: "是 故 某 等 今 日 ‧ 至 心 懺 悔"
            ),
            Verse(
                number: 6,
                text: "First, we should repent and reform for the Obstruction of Afflictions.",
                pinyin: "dì yī xiān yīng chàn huǐ fán nǎo zhàng",
                chinese: "第 一 先 應 懺 悔 煩 惱 障"
            ),
            Verse(
                number: 7,
                text: "These afflictions arise from the mind.",
                pinyin: "ér cǐ fán nǎo jiē cóng yì qǐ",
                chinese: "而 此 煩 惱 ‧ 皆 從 意 起"
            ),
            Verse(
                number: 8,
                text: "How does this happen? Due to mental karma, body and speech follow in action.",
                pinyin: "suǒ yǐ zhě hé yì yè qǐ gù zé shēn yǔ kǒu suí zhī ér dòng",
                chinese: "所 以 者 何 。 意 業 起 故 ‧ 則 身 與 口 ‧ 隨 之 而 動"
            ),
            Verse(
                number: 9,
                text: "There are three kinds of mental karma. First is greed and desire, second is anger and aversion, third is ignorance.",
                pinyin: "yì yè yǒu sān yī zhě qiān tān èr zhě chēn huì sān zhě chī àn",
                chinese: "意 業 有 三 。 一 者 慳 貪 ‧ 二 者 瞋 恚 ‧ 三 者 癡 闇"
            ),
            Verse(
                number: 10,
                text: "Because of ignorance, wrong view arises and one commits unwholesome acts.",
                pinyin: "yóu chī àn gù qǐ zhū xié jiàn zào zhū bú shàn",
                chinese: "由 癡 闇 故 ‧ 起 諸 邪 見 ‧ 造 諸 不 善"
            ),
            Verse(
                number: 11,
                text: "Thus, the sūtra states that actions of desire, aversion, and ignorance can cause sentient beings to fall into the realms of hell, hungry ghosts, and animals, where they experience suffering.",
                pinyin: "shì gù jīng yán tān chēn chī yè néng lìng zhòng shēng duò yú dì yù è guǐ chù shēng shòu kǔ",
                chinese: "是 故 經 言 ‧ 貪 瞋 癡 業 ‧ 能 令 衆 生 ‧ 墮 於 地 獄 、 餓 鬼 、 畜 生 受 苦"
            ),
            Verse(
                number: 12,
                text: "If they are born as humans, then they will be poor, destitute, lonely, homeless, vicious, spiteful, stubborn, and dull.",
                pinyin: "ruò shēng rén zhōng dé pín qióng gū lù xiōng hěn wán dùn yú mí wú zhī",
                chinese: "若 生 人 中 ‧ 得 貧 窮 孤 露 ‧ 兇 狠 頑 鈍 ‧ 愚 迷 無 知"
            ),
            Verse(
                number: 13,
                text: "In their delusion, they do not know that these afflictions are retributions and that mental karma causes these terrible results.",
                pinyin: "zhū fán nǎo bào yì yè jì yǒu rú cǐ è guǒ",
                chinese: "諸 煩 惱 報 。 意 業 既 有 如 此 惡 果"
            ),
            Verse(
                number: 14,
                text: "Thus, today, we sincerely return our lives in refuge to the buddhas and request empathy in repenting and reforming.",
                pinyin: "shì gù zhòng děng jīn rì zhì xīn guī mìng zhū fú qiú āi chàn huǐ",
                chinese: "是 故 某 等 ‧ 今 日 至 心 皈 命 諸 佛 ‧ 求 哀 懺 悔"
            ),
            Verse(
                number: 15,
                text: "These afflictions are subject to all sorts of blame by the buddhas, bodhisattvas, and sages who grasp reality.",
                pinyin: "fú cǐ fán nǎo zhū fó pú sà rù lǐ shèng rén zhǒng zhǒng hē zé",
                chinese: "夫 此 煩 惱 ‧ 諸 佛 菩 薩 ‧ 入 理 聖 人 ‧ 種 種 呵 責"
            ),
            Verse(
                number: 16,
                text: "They also call these afflictions enemies.",
                pinyin: "yì míng cǐ fán nǎo yǐ wéi yuàn jiā",
                chinese: "亦 名 此 煩 惱 以 為 怨 家"
            ),
            Verse(
                number: 17,
                text: "Why is this? Because these afflictions are able to sever the root of the wisdom life of sentient beings.",
                pinyin: "hé yǐ gù néng duàn zhòng shēng huì mìng gēn gù",
                chinese: "何 以 故 。 能 斷 眾 生 ‧ 慧 命 根 故"
            ),
            Verse(
                number: 18,
                text: "They also call these afflictions thieves.",
                pinyin: "yì míng cǐ fán nǎo yǐ zhī wèi zéi",
                chinese: "亦 名 此 煩 惱 以 之 為 賊"
            ),
            Verse(
                number: 19,
                text: "Because these afflictions are able to steal the virtuous Dharmas of sentient beings.",
                pinyin: "néng jié zhòng shēng zhū shàn fǎ gù",
                chinese: "能 劫 衆 生 諸 善 法 故"
            ),
            Verse(
                number: 20,
                text: "They also call these afflictions turbulent rivers because these afflictions are able to sweep sentient beings into the Great Sea of Suffering of birth and death.",
                pinyin: "yì míng cǐ fán nǎo yǐ wèi pù hé néng piào zhòng shēng rù yú shēng sǐ dà kǔ hǎi gù",
                chinese: "亦 名 此 煩 惱 以 為 瀑 河 ‧ 能 漂 衆 生 入 於 生 死 大 苦 海 故"
            ),
            Verse(
                number: 21,
                text: "They also call these afflictions shackles because these afflictions can lock sentient beings in the prison of birth and death without any way out.",
                pinyin: "yì míng cǐ fán nǎo yǐ wèi jī suǒ néng xì zhòng zhòng yú shēng sǐ yù bù néng dé chū gù",
                chinese: "亦 名 此 煩 惱 以 為 覉 鎖 ‧ 能 繫 衆 生 於 生 死 獄 ‧ 不 能 得 出 故"
            ),
            Verse(
                number: 22,
                text: "This is why the Six Realms continue, and the Four Forms of Existence do not end;",
                pinyin: "suǒ yǐ liù dào qiān lián sì shēng bù jué",
                chinese: "所 以 六 道 牽 連 ‧ 四 生 不 絕"
            ),
            Verse(
                number: 23,
                text: "unwholesome deeds are limitless, and the fruits of suffering do not cease.",
                pinyin: "è yè wú qióng kǔ guǒ bù xī",
                chinese: "惡 業 無 窮 ‧ 苦 果 不 息"
            ),
            Verse(
                number: 24,
                text: "One should know that these are all faults of afflictions.",
                pinyin: "dāng zhī jiē shì fán nǎo guò huàn",
                chinese: "當 知 皆 是 煩 惱 過 患"
            ),
            Verse(
                number: 25,
                text: "Thus, today, we give rise to this virtuous mind of improvement and request empathy in repenting and reforming.",
                pinyin: "shì gù jīn rì yùn cǐ zēng shàng shàn xīn qiú āi chàn huǐ",
                chinese: "是 故 今 日 ‧ 運 此 增 上 善 心 ‧ 求 哀 懺 悔"
            ),
            Verse(
                number: 26,
                text: "Since beginningless time until today, we, the assembly, whether as human, celestial, or other beings within the Six Realms, have filled our hearts and consciousnesses with ignorance",
                pinyin: "zhòng děng zì cóng wú shǐ yǐ lái zhì yú jīn rì huò zài rén tiān liù dào shòu bào yǒu cǐ xīn shí cháng huái yú huò fán mǎn xiōng jīn",
                chinese: "某 等 自 從 無 始 以 來 ‧ 至 于 今 日 ‧ 或 在 人 天 ‧ 六 道 受 報 ‧ 有 此 心 識 ‧ 常 懷 愚 惑 ‧ 繁 滿 胸 襟"
            ),
            Verse(
                number: 27,
                text: "and disturbed and harmed all sentient beings in the Six Realms and Four Forms of Existence, whether committing all transgressions because of the Three Poisons,",
                pinyin: "huò yīn sān dú gēn zào yí qiè zuì",
                chinese: "或 因 三 毒 根 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 28,
                text: "whether committing all transgressions because of the Three Outflows.",
                pinyin: "huò yīn sān lòu zào yí qiè zuì",
                chinese: "或 因 三 漏 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 29,
                text: "Whether committing all transgressions because of the Three Sufferings,",
                pinyin: "huò yīn sān kǔ zào yí qiè zuì",
                chinese: "或 因 三 苦 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 30,
                text: "whether committing all transgressions because of the Three Delusions,",
                pinyin: "huò yuán sān dǎo zào yí qiè zuì",
                chinese: "或 緣 三 倒 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 31,
                text: "or whether committing all transgressions because of attachment towards the Three Realms,",
                pinyin: "huò tān sān yǒu zào yí qiè zuì",
                chinese: "或 貪 三 有 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 32,
                text: "these transgressions are limitless and boundless.",
                pinyin: "rú shì děng zuì wú liàng wú biān",
                chinese: "如 是 等 罪 ‧ 無 量 無 邊"
            ),
            Verse(
                number: 33,
                text: "Today, we are remorseful and shameful as we repent and reform for all of these.",
                pinyin: "nǎo luàn yí qiè liù dào sì shēng jīn rì cán kuì jiē xī chàn huǐ",
                chinese: "惱 亂 一 切 六 道 四 生 ‧ 今 日 慚 愧 ‧ 皆 悉 懺 悔"
            ),
            Verse(
                number: 34,
                text: "Furthermore, since beginningless time until today, we, the assembly, disturbed and harmed all sentient beings in the Six Realms,",
                pinyin: "yòu fù zhòng děng zì cóng wú shǐ yǐ lái zhì yú jīn rì",
                chinese: "又 復 某 等 ‧ 自 從 無 始 以 來 ‧ 至 于 今 日"
            ),
            Verse(
                number: 35,
                text: "whether committing all transgressions because of the Four [Attachments of] Consciousness,",
                pinyin: "huò yīn sì zhù zào yí qiè zuì",
                chinese: "或 因 四 住 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 36,
                text: "whether committing all transgressions because of the Four Flows,",
                pinyin: "huò yīn sì liú zào yí qiè zuì",
                chinese: "或 因 四 流 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 37,
                text: "whether committing all transgressions because of the Four Graspings,",
                pinyin: "huò yīn sì qǔ zào yí qiè zuì",
                chinese: "或 因 四 取 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 38,
                text: "whether committing all transgressions because of the Four Attachments.",
                pinyin: "huò yīn sì zhí zào yí qiè zuì",
                chinese: "或 因 四 執 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 39,
                text: "Whether committing all transgressions because of the Four Conditions,",
                pinyin: "huò yīn sì yuán zào yí qiè zuì",
                chinese: "或 因 四 緣 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 40,
                text: "whether committing all transgressions because of attachment towards the Four Elements,",
                pinyin: "huò yīn sì dà zào yí qiè zuì",
                chinese: "或 因 四 大 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 41,
                text: "whether committing all transgressions because of attachment towards the Four Bindings,",
                pinyin: "huò yīn sì fù zào yí qiè zuì",
                chinese: "或 因 四 縛 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 42,
                text: "whether committing all transgressions because of attachment towards the Four Desires,",
                pinyin: "huò yīn sì tān zào yí qiè zuì",
                chinese: "或 因 四 貪 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 43,
                text: "or whether committing all transgressions because of the Four Forms of Existence,",
                pinyin: "huò yīn sì shēng zào yí qiè zuì",
                chinese: "或 因 四 生 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 44,
                text: "these transgressions are limitless and boundless.",
                pinyin: "rú shì děng zuì wú liàng wú biān",
                chinese: "如 是 等 罪 ‧ 無 量 無 邊"
            ),
            Verse(
                number: 45,
                text: "Today, we are remorseful and shameful as we repent and reform for all of these.",
                pinyin: "nǎo luàn liù dào yí qiè zhòng shēng jīn rì cán kuì jiē xī chàn huǐ",
                chinese: "惱 亂 六 道 一 切 衆 生 。 今 日 慚 愧 ‧ 皆 悉 懺 悔"
            ),
            Verse(
                number: 46,
                text: "Furthermore, since beginningless time until today, we, the assembly, disturbed and harmed all sentient beings in the Six Realms,",
                pinyin: "yòu fù zhòng děng zì cóng wú shǐ yǐ lái zhì yú jīn rì",
                chinese: "又 復 某 等 ‧ 自 從 無 始 以 來 ‧ 至 于 今 日"
            ),
            Verse(
                number: 47,
                text: "whether committing all transgressions because of the Five Stages [of Misconceptions],",
                pinyin: "huò yīn wǔ zhù zào yí qiè zuì",
                chinese: "或 因 五 住 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 48,
                text: "whether committing all transgressions because of the Five Coverings,",
                pinyin: "huò yīn wǔ gài zào yí qiè zuì",
                chinese: "或 因 五 蓋 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 49,
                text: "whether committing all transgressions because of the Five Forms of Stinginess,",
                pinyin: "huò yīn wǔ qiān zào yí qiè zuì",
                chinese: "或 因 五 慳 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 50,
                text: "whether committing all transgressions because of the Five Views,",
                pinyin: "huò yīn wǔ jiàn zào yí qiè zuì",
                chinese: "或 因 五 見 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 51,
                text: "or whether committing all transgressions because of the Five Minds,",
                pinyin: "huò yīn wǔ xīn zào yí qiè zuì",
                chinese: "或 因 五 心 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 52,
                text: "these transgressions are limitless and boundless.",
                pinyin: "rú shì děng fán nǎo wú liàng wú biān",
                chinese: "如 是 等 煩 惱 ‧ 無 量 無 邊"
            ),
            Verse(
                number: 53,
                text: "Today, we confess as well as repent and reform for all of these.",
                pinyin: "nǎo luàn liù dào yí qiè zhòng shēng jīn rì fā lù jiē xī chàn huǐ",
                chinese: "惱 亂 六 道 一 切 衆 生 。 今 日 發 露 ‧ 皆 悉 懺 悔"
            ),
            Verse(
                number: 54,
                text: "Furthermore, since beginningless time until today, we, the assembly, have disturbed and harmed all sentient beings in the Six Realms,",
                pinyin: "yòu fù zhòng děng zì cóng wú shǐ yǐ lái zhì yú jīn rì",
                chinese: "又 復 某 等 ‧ 自 從 無 始 以 來 ‧ 至 于 今 日"
            ),
            Verse(
                number: 55,
                text: "whether committing all transgressions because of the Six Emotions,",
                pinyin: "huò yīn liù gēn zào yí qiè zuì",
                chinese: "或 因 六 根 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 56,
                text: "whether committing all transgressions because of the Six Consciousnesses,",
                pinyin: "huò yīn liù shì zào yí qiè zuì",
                chinese: "或 因 六 識 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 57,
                text: "whether committing all transgressions because of the Six Perceptions,",
                pinyin: "huò yīn liù xiǎng zào yí qiè zuì",
                chinese: "或 因 六 想 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 58,
                text: "whether committing all transgressions because of the Six Sensations.",
                pinyin: "huò yīn liù shòu zào yí qiè zuì",
                chinese: "或 因 六 受 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 59,
                text: "Whether committing all transgressions because of the Six Volitions,",
                pinyin: "huò yīn liù xíng zào yí qiè zuì",
                chinese: "或 因 六 行 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 60,
                text: "whether committing all transgressions because of the Six Passions,",
                pinyin: "huò yīn liù ài zào yí qiè zuì",
                chinese: "或 因 六 愛 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 61,
                text: "or whether committing all transgressions because of the Six Doubts,",
                pinyin: "huò yīn liù yí zào yí qiè zuì",
                chinese: "或 因 六 疑 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 62,
                text: "these transgressions are limitless and boundless.",
                pinyin: "rú shì děng fán nǎo wú liàng wú biān",
                chinese: "如 是 等 煩 惱 ‧ 無 量 無 邊"
            ),
            Verse(
                number: 63,
                text: "Today, we are remorseful and shameful as we repent and reform for all of these.",
                pinyin: "nǎo luàn liù dào yí qiè zhòng shēng jīn rì cán kuì fā lù jiē xī chàn huǐ",
                chinese: "惱 亂 六 道 一 切 衆 生 。 今 日 慚 愧 發 露 ‧ 皆 悉 懺 悔"
            ),
            Verse(
                number: 64,
                text: "Furthermore, since beginningless time until today, we, the assembly, disturbed and harmed all sentient beings in the Six Realms,",
                pinyin: "yòu fù zhòng děng zì cóng wú shǐ yǐ lái zhì yú jīn rì",
                chinese: "又 復 某 等 ‧ 自 從 無 始 以 來 ‧ 至 于 今 日"
            ),
            Verse(
                number: 65,
                text: "whether committing all transgressions because of the Seven Outflows,",
                pinyin: "huò yīn qī lòu zào yí qiè zuì",
                chinese: "或 因 七 漏 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 66,
                text: "whether committing all transgressions because of the Seven Tendencies,",
                pinyin: "huò yīn qī shǐ zào yí qiè zuì",
                chinese: "或 因 七 使 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 67,
                text: "whether committing all transgressions because of the Eight Delusions,",
                pinyin: "huò yīn bā dǎo zào yí qiè zuì",
                chinese: "或 因 八 倒 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 68,
                text: "whether committing all transgressions because of the Eight Defilements,",
                pinyin: "huò yīn bā gòu zào yí qiè zuì",
                chinese: "或 因 八 垢 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 69,
                text: "or whether committing all transgressions because of the Eight Sufferings,",
                pinyin: "huò yīn bā kǔ zào yí qiè zuì",
                chinese: "或 因 八 苦 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 70,
                text: "these transgressions are limitless and boundless.",
                pinyin: "rú shì děng fán nǎo wú liàng wú biān",
                chinese: "如 是 等 煩 惱 ‧ 無 量 無 邊"
            ),
            Verse(
                number: 71,
                text: "Today, we confess as well as repent and reform for all of these.",
                pinyin: "nǎo luàn liù dào yí qiè zhòng shēng jīn rì fā lù jiē xī chàn huǐ",
                chinese: "惱 亂 六 道 一 切 衆 生 。 今 日 發 露 ‧ 皆 悉 懺 悔"
            ),
            Verse(
                number: 72,
                text: "Furthermore, since beginningless time until today, we, the assembly, burn ablaze from day to night and open the gates of outflow,",
                pinyin: "yòu fù zhòng děng zì cóng wú shǐ yǐ lái zhì yú jīn rì",
                chinese: "又 復 某 等 ‧ 自 從 無 始 以 來 ‧ 至 于 今 日"
            ),
            Verse(
                number: 73,
                text: "whether committing all transgressions because of the Nine Difficulties,",
                pinyin: "huò yīn jiǔ nǎo zào yí qiè zuì",
                chinese: "或 因 九 惱 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 74,
                text: "whether committing all transgressions because of the Nine Fetters,",
                pinyin: "huò yīn jiǔ jié zào yí qiè zuì",
                chinese: "或 因 九 結 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 75,
                text: "whether committing all transgressions because of the Nine Conditions,",
                pinyin: "huò yīn jiǔ yuán zào yí qiè zuì",
                chinese: "或 因 九 緣 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 76,
                text: "whether committing all transgressions because of the Ten Afflictions.",
                pinyin: "huò yīn shí fán nǎo zào yí qiè zuì",
                chinese: "或 因 十 煩 惱 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 77,
                text: "Whether committing all transgressions because of the Ten Bonds,",
                pinyin: "huò yīn shí chán zào yí qiè zuì",
                chinese: "或 因 十 纏 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 78,
                text: "whether committing all transgressions because of the Eleven Biases,",
                pinyin: "huò yīn shí yī piàn shǐ zào yí qiè zuì",
                chinese: "或 因 十 一 徧 使 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 79,
                text: "whether committing all transgressions because of the Twelve Contacts,",
                pinyin: "huò yīn shí èr rù zào yí qiè zuì",
                chinese: "或 因 十 二 入 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 80,
                text: "whether committing all transgressions because of the Sixteen Understandings and Views,",
                pinyin: "huò yīn shí liù zhī jiàn zào yí qiè zuì",
                chinese: "或 因 十 六 知 見 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 81,
                text: "whether committing all transgressions because of the Eighteen Realms,",
                pinyin: "huò yīn shí bā jiè zào yí qiè zuì",
                chinese: "或 因 十 八 界 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 82,
                text: "whether committing all transgressions because of the Twenty-Five Aspects of Self,",
                pinyin: "huò yīn èr shí wǔ wǒ zào yí qiè zuì",
                chinese: "或 因 二 十 五 我 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 83,
                text: "whether committing all transgressions because of the Sixty-Two Views.",
                pinyin: "huò yīn liù shí èr jiàn zào yí qiè zuì",
                chinese: "或 因 六 十 二 見 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 84,
                text: "Or whether committing all transgressions because of thoughts after seeing the truth, the Ninety-Eight Afflictions, or the One Hundred and Eight Afflictions,",
                pinyin: "huò yīn jiàn dì sī wéi jiǔ shí bā shǐ bǎi bā fán nǎo zhòu yè chì rán kāi zhū lòu mén zào yí qiè zuì",
                chinese: "或 因 見 諦 思 惟 九 十 八 使 ‧ 百 八 煩 惱 ‧ 晝 夜 熾 然 ‧ 開 諸 漏 門 ‧ 造 一 切 罪"
            ),
            Verse(
                number: 85,
                text: "these transgressions harm and disturb the worthy sages and the Four Forms of Existence,",
                pinyin: "nǎo luàn xian shèng jí yǐ sì shēng",
                chinese: "惱 亂 賢 聖 ‧ 及 以 四 生"
            ),
            Verse(
                number: 86,
                text: "fill the Three Realms and extend throughout the Six Realms without any place to escape.",
                pinyin: "piàn mǎn sān jiè mí gèn liù dào wú chù kě bì",
                chinese: "徧 滿 三 界 ‧ 彌 亘 六 道 ‧ 無 處 可 避"
            ),
            Verse(
                number: 87,
                text: "Today, we sincerely pray to the Buddhas, honored Dharma, and sacred Sangha of the ten directions.",
                pinyin: "jīn rì zhì dǎo xiàng shí fāng fó zūn fǎ shèng zhòng",
                chinese: "今 日 致 禱 ‧ 向 十 方 佛 、 尊 法 、 聖 衆"
            ),
            Verse(
                number: 88,
                text: "We are remorseful and shameful as we repent and reform for all of these.",
                pinyin: "cán kuì fā lù jiē xī chàn huǐ",
                chinese: "慚 愧 發 露 ‧ 皆 悉 懺 悔"
            ),
            Verse(
                number: 89,
                text: "Through the merits and virtues born from repenting and reforming for all of the afflictions of the Three Poisons,",
                pinyin: "yuàn zhòng děng chéng shì chàn huǐ sān dú yí qiè fán nǎo suǒ shēng gōng dé",
                chinese: "願 某 等 承 是 懺 悔 ‧ 三 毒 一 切 煩 惱 ‧ 所 生 功 德"
            ),
            Verse(
                number: 90,
                text: "may we in the assembly illuminate the Three Wisdoms, grasp the Three Understandings, eradicate the Three Sufferings, and fulfill the Three Vows, birth after birth, lifetime after lifetime.",
                pinyin: "shēng shēng shì shì sān huì míng sān dá lǎng sān kǔ miè sān yuàn mǎn",
                chinese: "生 生 世 世 ‧ 三 慧 明 ‧ 三 達 朗 ‧ 三 苦 滅 ‧ 三 願 滿"
            ),
            Verse(
                number: 91,
                text: "Through the merits and virtues born from repenting and reforming for all of the afflictions of the Four Consciousnesses,",
                pinyin: "yuàn chéng shì chàn huǐ sì shí děng yí qiè fán nǎo suǒ shēng gōng dé",
                chinese: "願 承 是 懺 悔 ‧ 四 識 等 一 切 煩 惱 ‧ 所 生 功 德"
            ),
            Verse(
                number: 92,
                text: "may we in the assembly expand the Four Kinds of Mind, establish the Four Faiths, eradicate the Four Lower Realms, and obtain the Four Kinds of Fearlessness, birth after birth, lifetime after lifetime.",
                pinyin: "shēng shēng shì shì guǎng sì děng xīn lì sì xìn yè miè sì è qù dé sì wú wèi",
                chinese: "生 生 世 世 ‧ 廣 四 等 心 ‧ 立 四 信 業 ‧ 滅 四 惡 趣 ‧ 得 四 無 畏"
            ),
            Verse(
                number: 93,
                text: "Through the merits and virtues born from repenting and reforming for all of the afflictions of the Five Coverings,",
                pinyin: "yuàn chéng shì chàn huǐ wǔ gài děng zhū fán nǎo suǒ shēng gōng dé",
                chinese: "願 承 是 懺 悔 ‧ 五 蓋 等 諸 煩 惱 ‧ 所 生 功 德"
            ),
            Verse(
                number: 94,
                text: "may we in the assembly liberate the Five Realms, establish the Five Faculties, purify the Five Eyes, and complete the Five Parts [of the Dhama Body].",
                pinyin: "dù wǔ dào shù wǔ gēn jìng wǔ yǎn chéng wǔ fēn",
                chinese: "度 五 道 ‧ 豎 五 根 ‧ 淨 五 眼 ‧ 成 五 分"
            ),
            Verse(
                number: 95,
                text: "Through the merits and virtues born from repenting and reforming for all of the afflictions of the Six Sensations,",
                pinyin: "yuàn chéng shì chàn huǐ liù shòu děng zhū fán nǎo suǒ shēng gōng dé",
                chinese: "願 承 是 懺 悔 ‧ 六 受 等 諸 煩 惱 ‧ 所 生 功 德"
            ),
            Verse(
                number: 96,
                text: "may we in the assembly obtain the Six Spiritual Powers, perfect actions of the Six Pāramitās, not be misled by the Six Dusts, and always practice the Six Wondrous [Gates], birth after birth, lifetime after lifetime.",
                pinyin: "shēng shēng shì shì jù zú liù shén tōng mǎn zú liù dù yè bú wèi liù chén huò cháng xíng liù miào hèng",
                chinese: "生 生 世 世 ‧ 具 足 六 神 通 ‧ 滿 足 六 度 業 ‧ 不 為 六 塵 惑 ‧ 常 行 六 妙 行"
            ),
            Verse(
                number: 97,
                text: "Through the merits and virtues born from repenting and reforming for all of the afflictions of the Seven Outflows, Eight Defilements, Nine Fetters, and Ten Bonds,",
                pinyin: "yòu yuàn chéng shì chàn huǐ qī lòu bā gòu jiǔ jié shí chán děng yí qiè zhū fán nǎo suǒ shēng gōng dé",
                chinese: "又 願 承 是 懺 悔 、 七 漏 、 八 垢 、 九 結 、 十 纏 等 ‧ 一 切 諸 煩 惱 ‧ 所 生 功 德"
            ),
            Verse(
                number: 98,
                text: "may we, the assembly, sit on the Lotus of Seven Purities, wash ourselves with the Water of Eight Liberations, accumulate the Nine Severing Wisdoms, and complete the practices of the Ten Grounds, birth after birth, lifetime after lifetime.",
                pinyin: "shēng shēng shì shì zuò qī jìng huá xǐ bā jiě shuǐ jù jiǔ duàn zhì chéng shí dì hèng",
                chinese: "生 生 世 世 ‧ 坐 七 淨 華 ‧ 洗 八 解 水 ‧ 具 九 斷 智 ‧ 成 十 地 行"
            ),
            Verse(
                number: 99,
                text: "Through the merits and virtues born from repenting and reforming for all of the afflictions of the Eleven Biases, Twelve Contacts, and Eighteen Realms,",
                pinyin: "yuàn yǐ chàn huǐ shí yī piàn shǐ jí shí èr rù shí bā jiè děng yí qiè zhū fán nǎo suǒ shēng gōng dé",
                chinese: "願 以 懺 悔 ‧ 十 一 徧 使 ‧ 及 十 二 入 ‧ 十 八 界 等 ‧ 一 切 諸 煩 惱 ‧ 所 生 功 德"
            ),
            Verse(
                number: 100,
                text: "may we, the assembly, be able to understand the Eleven Kinds of Emptiness and always rest the mind in ease,",
                pinyin: "yuàn shí yī kōng néng jiě cháng yòng qī xīn zì zài",
                chinese: "願 十 一 空 能 解 ‧ 常 用 栖 心 自 在"
            ),
            Verse(
                number: 101,
                text: "be able to turn the Dharma Wheel of Twelve Aspects,",
                pinyin: "néng zhuǎn shí èr hè n fǎ lún",
                chinese: "能 轉 十 二 行 法 輪"
            ),
            Verse(
                number: 102,
                text: "obtain the Eighteen Distinct Traits, and perfect all limitless merits and virtues.",
                pinyin: "jù zú shí bā bú gòng zhī fǎ wú liàng gōng dé yí qiè yuán mǎn",
                chinese: "具 足 十 八 不 共 之 法 ‧ 無 量 功 德 ‧ 一 切 圓 滿"
            ),
            Verse(
                number: 103,
                text: "Having made vows, we return our lives in refuge and venerate the buddhas!",
                pinyin: "fā yuàn yǐ guī mìng lǐ zhū fó",
                chinese: "發 願 已 ‧ 皈 命 禮 諸 佛"
            ),
            Verse(
                number: 104,
                text: "Homage to Vairocana Buddha, Homage to our teacher Śākyamuni Buddha, Homage to Amitābha Buddha, Homage to Maitreya Buddha, Homage to Nāgagotrodārajñānarāja Buddha, Homage to Nāgeśvararāja Buddha, Homage to Prabhūtaratna Buddha, Homage to Buddhapuṇḍarīkadhyaneśvararāja Buddha, Homage to Kasayadhvaja Buddha, Homage to Siṃhanāda Buddha",
                pinyin: "ná mó pí lú zhē nà fó ná mó běn shī shì jiā móu ní fó ná mó ē mí tuó fó ná mó mí lè fó ná mó lóng zhǒng shàng zūn wáng fó ná mó lóng zì zài wáng fó ná mó bǎo shèng fó ná mó jué huá dìng zì zài wáng fó ná mó jiā shā chuáng fó ná mó shī zi hǒu fó",
                chinese: "南 無 毗 盧 遮 那 佛 南 無 本 師 釋 迦 牟 尼 佛 南 無 阿 彌 陀 佛 南 無 彌 勒 佛 南 無 龍 種 上 尊 王 佛 南 無 龍 自 在 王 佛 南 無 寶 勝 佛 南 無 覺 華 定 自 在 王 佛 南 無 袈 裟 幢 佛 南 無 師 子 吼 佛"
            ),
            Verse(
                number: 105,
                text: "Homage to Mañjuśrī Bodhisattva, Homage to Samantabhadra Bodhisattva, Homage to Mahāsthāmaprāpta Bodhisattva, Homage to Kṣitigarbha Bodhisattva, Homage to Mahāvyūha Bodhisattva, Homage to Avalokiteśvara Bodhisattva",
                pinyin: "ná mó wén shū shī lì pú sà ná mó pǔ xián pú sà ná mó dà shì zhì pú sà ná mó dì zàng pú sà ná mó dà zhuāng yán pú sà ná mó guān zì zài pú sà",
                chinese: "南 無 文 殊 師 利 菩 薩 南 無 普 賢 菩 薩 南 無 大 勢 至 菩 薩 南 無 地 藏 菩 薩 南 無 大 莊 嚴 菩 薩 南 無 觀 自 在 菩 薩"
            ),
            Verse(
                number: 106,
                text: "Having prostrated to the buddhas, again, repent and reform.",
                pinyin: "● lǐ zhū fó yǐ cì fù chàn huǐ",
                chinese: "禮 諸 佛 已 ‧ 次 復 懺 悔"
            ),
            Verse(
                number: 107,
                text: "In explaining repentance and reformation, fundamentally, it is rectifying the past and cultivating for the future; eradicating evils and giving rise to virtues.",
                pinyin: "fū lùn chàn huǐ zhě běn shì gǎi wǎng xiū lái miè è xīng shàn",
                chinese: "夫 論 懺 悔 者 ‧ 本 是 改 往 修 來 ‧ 滅 惡 興 善"
            ),
            Verse(
                number: 108,
                text: "Of the humans in this world, who has not made any mistakes?",
                pinyin: "rén zhī jū shì shuí néng wú guò",
                chinese: "人 之 居 世 ‧ 誰 能 無 過"
            ),
            Verse(
                number: 109,
                text: "Because those who are learning lose their mindfulness, afflictions arise.",
                pinyin: "xué rén shī niàn shàng qǐ fán nǎo",
                chinese: "學 人 失 念 ‧ 尚 起 煩 惱"
            ),
            Verse(
                number: 110,
                text: "Even an arhat forms habits and creates [karma] through their body, speech, and mind.",
                pinyin: "luó hàn jié xí dòng shēn kǒu yè",
                chinese: "羅 漢 結 習 ‧ 動 身 口 業"
            ),
            Verse(
                number: 111,
                text: "How much more so for unawakened beings who believe they are faultless?",
                pinyin: "qǐ kuàng fán fū ér dāng wú guò",
                chinese: "豈 況 凡 夫 ‧ 而 當 無 過"
            ),
            Verse(
                number: 112,
                text: "However, the wise realize this quickly and are able to change,",
                pinyin: "dàn zhì zhě xiān jué biàn néng gǎi huǐ",
                chinese: "但 智 者 先 覺 ‧ 便 能 改 悔"
            ),
            Verse(
                number: 113,
                text: "whereas the ignorant conceal [their mistakes] and cause them to grow.",
                pinyin: "yú zhě fù cáng suì shǐ zī màn",
                chinese: "愚 者 覆 藏 ‧ 遂 使 滋 蔓"
            ),
            Verse(
                number: 114,
                text: "Thus, one accumulates habits in the eternal night without any expectation of dawn or awakening.",
                pinyin: "suǒ yǐ cháng yè jī xí xiǎo wù wú qī",
                chinese: "所 以 長 夜 積 習 ‧ 曉 悟 無 期"
            ),
            Verse(
                number: 115,
                text: "If one is able to confess as well as repent and reform with remorse and shame, then how could one merely eradicate offenses?",
                pinyin: "ruò néng cán kuì fā lù chàn huǐ zhě qǐ wéi zhǐ shì miè zuì",
                chinese: "若 能 慚 愧 ‧ 發 露 懺 悔 者 ‧ 豈 惟 止 是 滅 罪"
            ),
            Verse(
                number: 116,
                text: "One would also gain limitless merits and virtues as well as establish the wondrous result of the Tathāgata's nirvāṇa.",
                pinyin: "yì fù zēng zhǎng wú liàng gōng dé shù lì rú lái niè pán miào guǒ",
                chinese: "亦 復 增 長 無 量 功 德 ‧ 豎 立 如 來 涅 槃 妙 果"
            ),
            Verse(
                number: 117,
                text: "If one wishes to practice this method, then externally, one should first tidy one's appearance, be solemn in behavior, and venerate an honored image;",
                pinyin: "ruò yù xíng cǐ fǎ zhě xiān dāng wài sù xíng yí zhān fèng zūn xiàng",
                chinese: "若 欲 行 此 法 者 ‧ 先 當 外 肅 形 儀 ‧ 瞻 奉 尊 像"
            ),
            Verse(
                number: 118,
                text: "internally, one should give rise to reverence, be immersed in the method of visualization, and sincerely give rise to the Two Kinds of Mind.",
                pinyin: "nèi qǐ jìng yì yuán yú xiǎng fǎ kěn qiè zhì dǎo shēng èr zhǒng xīn",
                chinese: "內 起 敬 意 ‧ 緣 於 想 法 。 懇 切 至 禱 ‧ 生 二 種 心"
            ),
            Verse(
                number: 119,
                text: "What are these two?",
                pinyin: "hé děng wéi èr",
                chinese: "何 等 為 二"
            ),
            Verse(
                number: 120,
                text: "First, think to oneself, my life and body is impossible to preserve forever.",
                pinyin: "yī zhě zì niàn wǒ cǐ xíng mìng nán kě cháng bǎo",
                chinese: "一 者 自 念 ‧ 我 此 形 命 ‧ 難 可 常 保"
            ),
            Verse(
                number: 121,
                text: "One morning, it will decay and disperse without knowing when this body will return.",
                pinyin: "yì zhāo sàn huài bù zhī cǐ shēn hé shí kě fù",
                chinese: "一 朝 散 壞 ‧ 不 知 此 身 ‧ 何 時 可 復"
            ),
            Verse(
                number: 122,
                text: "If I continue to not value the buddhas and worthy sages, then I will surely meet evil friends and create plenty of unwholesome karma.",
                pinyin: "ruò fù bù zhí zhū fó xián shèng hū féng è yǒu zào zhòng zuì yè",
                chinese: "若 復 不 值 諸 佛 賢 聖 ‧ 忽 逢 惡 友 ‧ 造 衆 罪 業"
            ),
            Verse(
                number: 123,
                text: "Then, I will fall into the abyss of the dangerous realms.",
                pinyin: "fù yīng duò luò shēn kēng xiǎn qù",
                chinese: "復 應 墮 落 深 坑 險 趣"
            ),
            Verse(
                number: 124,
                text: "Second, think to oneself, although I have been able to encounter the Tathāgata's proper Dharma in this life,",
                pinyin: "èr zhě zì niàn wǒ cǐ shēng zhōng suī dé zhí yù rú lái zhèng fǎ",
                chinese: "二 者 自 念 ‧ 我 此 生 中 ‧ 雖 得 值 遇 ‧ 如 來 正 法"
            ),
            Verse(
                number: 125,
                text: "I do not work to propagate the sacred seeds of the Buddhadharma; purify my body, speech, and mind; and abide in virtuous Dharmas.",
                pinyin: "bú wèi fó fǎ shào jì shèng zhǒng jìng shēn kǒu yì shàn fǎ zì jū",
                chinese: "不 為 佛 法 紹 繼 聖 種 ‧ 淨 身 口 意 ‧ 善 法 自 居"
            ),
            Verse(
                number: 126,
                text: "Up until now, we behaved unwholesomely in private and concealed these actions, saying that others will not know and that nobody saw it.",
                pinyin: "ér jīn wǒ děng sī zì zuò è ér fù fù cáng yán tā bù zhī wèi bǐ bú jiàn",
                chinese: "而 今 我 等 ‧ 私 自 作 惡 ‧ 而 復 覆 藏 。 言 他 不 知 ‧ 謂 彼 不 見"
            ),
            Verse(
                number: 127,
                text: "We hid these in our minds and were arrogant and shameless.",
                pinyin: "yǐn tè zài xīn ào rán wú kuì",
                chinese: "隱 慝 在 心 ‧ 傲 然 無 愧"
            ),
            Verse(
                number: 128,
                text: "This is a truly ignorant mistake indeed.",
                pinyin: "cǐ shí tiān xià yú huò zhī shèn",
                chinese: "此 實 天 下 ‧ 愚 惑 之 甚"
            ),
            Verse(
                number: 129,
                text: "Now, the buddhas of the ten directions, great bodhisattvas, celestial beings, deities, and sages have manifested.",
                pinyin: "jí jīn xiàn yǒu shí fāng zhū fó zhū dà pú sà zhū tiān shén xiān",
                chinese: "卽 今 現 有 十 方 諸 佛 、 諸 大 菩 薩 、 諸 天 神 仙"
            ),
            Verse(
                number: 130,
                text: "When have they not used their pure celestial eyes to see the evil transgressions that we committed?",
                pinyin: "hé céng bù yǐ qīng jìng tiān yǎn jiàn yú wǒ děng suǒ zuò zuì è",
                chinese: "何 曾 不 以 清 淨 天 眼 ‧ 見 於 我 等 ‧ 所 作 罪 惡"
            ),
            Verse(
                number: 131,
                text: "Furthermore, there are visible and invisible spirits that record offenses and merits without a hair of error.",
                pinyin: "yòu fù yōu xiǎn líng qí zhù jì zuì fú xiān háo wú chā",
                chinese: "又 復 幽 顯 靈 祇 ‧ 注 記 罪 福 ‧ 纖 毫 無 差"
            ),
            Verse(
                number: 132,
                text: "Regarding a person who has committed transgressions, at the end of their life, the Ox-Headed Wardens of Hell record their essence and spirit, debating and investigating their rights and wrongs before King Yāma.",
                pinyin: "fú lùn zuò zuì zhī rén mìng zhōng zhī hòu niú tóu yù zú lù qí jīng shén zài yán luó wang suǒ biàn hé shì fēi",
                chinese: "夫 論 作 罪 之 人 ‧ 命 終 之 後 ‧ 牛 頭 獄 卒 ‧ 錄 其 精 神 ‧ 在 閻 羅 王 所 ‧ 辯 覈 是 非"
            ),
            Verse(
                number: 133,
                text: "At this time, all of their enemies come to testify, each saying, 'You mutilated my body, then fried, boiled, steamed, and roasted it,'",
                pinyin: "dāng ěr zhī shí yí qiè yuàn duì jiē lái zhèng jù gè yán rǔ xiān tú lù wǒ shēn pào zhǔ zhēng zhì",
                chinese: "當 爾 之 時 ‧ 一 切 怨 對 ‧ 皆 來 證 據 。 各 言 汝 先 屠 戮 我 身 ‧ 炮 煮 蒸 炙"
            ),
            Verse(
                number: 134,
                text: "or, 'You first robbed me of all of my wealth and possessions, then separated me from my family. Today, I finally get to take advantage of you.'",
                pinyin: "huò xiān bō duó yú wǒ yí qiè cái bǎo lí wǒ juàn shǔ wǒ yú jīn rì shǐ dé rǔ biàn",
                chinese: "或 先 剝 奪 於 我 ‧ 一 切 財 寶 ‧ 離 我 眷 屬 。 我 於 今 日 ‧ 始 得 汝 便"
            ),
            Verse(
                number: 135,
                text: "When they appear and testify, how could anybody dare deny [their testimonies]?",
                pinyin: "yú shí xiàn qián zhèng jù hé dé gǎn huì",
                chinese: "於 時 現 前 證 據 。 何 得 敢 諱"
            ),
            Verse(
                number: 136,
                text: "One can only accept the retribution of past calamities willingly.",
                pinyin: "wéi yīng gān xīn fēn shòu sù yāng",
                chinese: "惟 應 甘 心 分 受 宿 殃"
            ),
            Verse(
                number: 137,
                text: "As the sūtras explain, the hells do not punish people unjustly.",
                pinyin: "rú jīng suǒ míng dì yù zhī zhōng bù wǎng zhì rén",
                chinese: "如 經 所 明 ‧ 地 獄 之 中 ‧ 不 枉 治 人"
            ),
            Verse(
                number: 138,
                text: "If someone forgets the many transgressions they habitually committed, then at the end of their life, then the locations where they committed the offense and all of the forms appear before them.",
                pinyin: "ruò qí ping sù suǒ zuò zhòng zuì xīn zì wàng shī zhě lín mìng zhōng shí zào è zhī chù yí qiè zhū xiāng jiē xiàn zài qián",
                chinese: "若 其 平 素 所 作 衆 罪 ‧ 心 自 忘 失 者 ‧ 臨 命 終 時 ‧ 造 惡 之 處 ‧ 一 切 諸 相 ‧ 皆 現 在 前"
            ),
            Verse(
                number: 139,
                text: "Each of them say, 'In the past, you did such and such a deed to me. How could you deny this now?'",
                pinyin: "gè yán rǔ xī zài yú wǒ biān zuò rú shì zuì jīn hé dé huì",
                chinese: "各 言 汝 昔 ‧ 在 於 我 邊 ‧ 作 如 是 罪 ‧ 今 何 得 諱"
            ),
            Verse(
                number: 140,
                text: "At this time, the transgressor has nowhere to conceal [the offenses].",
                pinyin: "shì shí zuò zuì zhī rén wú cáng yǐn chù",
                chinese: "是 時 作 罪 之 人 ‧ 無 藏 隱 處"
            ),
            Verse(
                number: 141,
                text: "Thus, King Yāma clenches his teeth, sentencing them to hell.",
                pinyin: "yú shì yán luó wang qiè chǐ hē zé jiāng fù dì yù",
                chinese: "於 是 閻 羅 王 ‧ 切 齒 呵 責 ‧ 將 付 地 獄"
            ),
            Verse(
                number: 142,
                text: "Even after limitless kalpas, they are unable to seek an escape.",
                pinyin: "lì wú liàng jié qiú chū mò yóu",
                chinese: "歷 無 量 劫 ‧ 求 出 莫 由"
            ),
            Verse(
                number: 143,
                text: "This matter is not distant, nor does it concern others.",
                pinyin: "cǐ shì bù yuǎn bù guān tā rén",
                chinese: "此 事 不 遠 。 不 關 他 人"
            ),
            Verse(
                number: 144,
                text: "It is on our bodies—we committed the deeds ourselves and we will undergo the retribution ourselves.",
                pinyin: "zhèng shì wǒ shēn zì zuò zì shòu",
                chinese: "正 是 我 身 ‧ 自 作 自 受"
            ),
            Verse(
                number: 145,
                text: "Although the closest relationship is between father and son, once we face the end, there is nobody who can undergo the retribution on another's behalf.",
                pinyin: "suī fù zi zhì qīn yí dàn duì zhì wú dài shòu zhě",
                chinese: "雖 父 子 至 親 ‧ 一 旦 對 至 ‧ 無 代 受 者"
            ),
            Verse(
                number: 146,
                text: "We have all obtained this human body, which is not infected with various illnesses.",
                pinyin: "wǒ děng xiāng yǔ dé cǐ rén shēn tǐ wú zhòng jí",
                chinese: "我 等 相 與 得 此 人 身 ‧ 體 無 衆 疾"
            ),
            Verse(
                number: 147,
                text: "We should each be diligent and work urgently, greatly fearing that when the end arrives, it will be too late to reform.",
                pinyin: "gè zì nǔ lì yǔ xìng mìng jìng dà bù zhì shí huǐ wú suǒ jí",
                chinese: "各 自 努 力 ‧ 與 性 命 競 ‧ 大 怖 至 時 ‧ 悔 無 所 及"
            ),
            Verse(
                number: 148,
                text: "Because of this, we sincerely request compassion through repenting and reforming.",
                pinyin: "shì gù zhì xīn qiú āi chàn huǐ",
                chinese: "是 故 至 心 ‧ 求 哀 懺 悔"
            ),
            Verse(
                number: 149,
                text: "From beginningless time until today, we have accumulated ignorance which obstructs our mind's eye,",
                pinyin: "zhòng děng zì cóng wú shǐ yǐ lái zhì yú jīn rì jī jù wú míng zhàng bì xīn mù",
                chinese: "某 等 自 從 無 始 以 來 ‧ 至 于 今 日 ‧ 積 聚 無 明 ‧ 障 蔽 心 目"
            ),
            Verse(
                number: 150,
                text: "went along with the nature of afflictions and committed transgressions in the Three Periods.",
                pinyin: "suí fán nǎo xìng zào sān shì shì",
                chinese: "隨 煩 惱 性 ‧ 造 三 世 罪"
            ),
            Verse(
                number: 151,
                text: "Today, we sincerely repent and reform for all afflictions, up to and including the Four Foundations [of Afflictions] since beginningless time.",
                pinyin: "huò dān rǎn ài zhuó qǐ tān yù fán nǎo",
                chinese: "或 耽 染 愛 著 ‧ 起 貪 欲 煩 惱"
            ),
            Verse(
                number: 152,
                text: "Attachments and other conditioned afflictions, whether they be from indulging in passion and attachments, giving rise the afflictions of desire;",
                pinyin: "huò chēn huì fèn nù huái hài fán nǎo",
                chinese: "或 瞋 恚 忿 怒 ‧ 懷 害 煩 惱"
            ),
            Verse(
                number: 153,
                text: "or harboring the afflictions of violence through aversion and anger;",
                pinyin: "huò xīn kuì hūn méng bù liǎo fán nǎo",
                chinese: "或 心 憒 惛 懵 ‧ 不 了 煩 惱"
            ),
            Verse(
                number: 154,
                text: "or being unable to end our afflictions due to mental delusions;",
                pinyin: "huò wǒ màn zì gāo qīng ào fán nǎo",
                chinese: "或 我 慢 自 高 ‧ 輕 傲 煩 惱"
            ),
            Verse(
                number: 155,
                text: "or underestimating afflictions due to arrogance;",
                pinyin: "yóu yù fán nǎo",
                chinese: "猶 豫 煩 惱"
            ),
            Verse(
                number: 156,
                text: "or the afflictions of hesitation due to doubts regarding the Noble Path.",
                pinyin: "bàng wú yīn guǒ",
                chinese: "謗 無 因 果"
            ),
            Verse(
                number: 157,
                text: "Or the afflictions of wrong view due to falsely claiming that there is no cause and effect;",
                pinyin: "xié jiàn fán nǎo",
                chinese: "邪 見 煩 惱"
            ),
            Verse(
                number: 158,
                text: "or the afflictions of attachment to self due to not understanding conditioned existence;",
                pinyin: "bù shì yuán jiǎ zhuó wǒ fán nǎo",
                chinese: "不 識 緣 假 ‧ 著 我 煩 惱"
            ),
            Verse(
                number: 159,
                text: "or clinging to the afflictions of eternalism and nihilism due to not understanding the Three Periods;",
                pinyin: "mí yú sān shì zhí duàn cháng fán nǎo",
                chinese: "迷 於 三 世 ‧ 執 斷 常 煩 惱"
            ),
            Verse(
                number: 160,
                text: "or giving rise to the afflictions of attachment to views due to becoming familiar with evil teachings;",
                pinyin: "péng xiá è fǎ qǐ jiàn qǔ fán nǎo",
                chinese: "朋 狎 惡 法 ‧ 起 見 取 煩 惱"
            ),
            Verse(
                number: 161,
                text: "or creating the afflictions of attachment to precepts (rites and rituals) due to apprenticing under deviant teachers.",
                pinyin: "pì bǐng xié shī zào jiè qǔ fán nǎo",
                chinese: "僻 稟 邪 師 ‧ 造 戒 取 煩 惱"
            ),
            Verse(
                number: 162,
                text: "Today, we sincerely repent and reform for all of these.",
                pinyin: "nǎi zhì yí qiè sì zhí héng jì fán nǎo jīn rì zhì chéng xī jiē chàn huǐ",
                chinese: "乃 至 一 切 四 執 ‧ 橫 計 煩 惱 。 今 日 至 誠 ‧ 悉 皆 懺 悔"
            ),
            Verse(
                number: 163,
                text: "Furthermore, since beginningless time until today, we disturbed and harmed all worthy sages and sentient beings in the Six Realms and Four Forms of Existence",
                pinyin: "yòu fù wú shǐ yǐ lái zhì yú jīn rì",
                chinese: "又 復 無 始 以 來 ‧ 至 于 今 日"
            ),
            Verse(
                number: 164,
                text: "through giving rise to limitless and boundless afflictions such as the afflictions of stinginess due to attachments to protecting and cherishing our property.",
                pinyin: "shǒu xí jiān zhuó qǐ qiān lìn fán nǎo",
                chinese: "守 惜 堅 著 ‧ 起 慳 吝 煩 惱"
            ),
            Verse(
                number: 165,
                text: "The afflictions of creation due to not restraining the Six Emotions;",
                pinyin: "bú shè liù qíng shē dàn fán nǎo",
                chinese: "不 攝 六 情 ‧ 奢 誕 煩 惱"
            ),
            Verse(
                number: 166,
                text: "the afflictions of intolerance due to harmful thoughts;",
                pinyin: "xīn xíng bì è bù rěn fán nǎo",
                chinese: "心 行 弊 惡 ‧ 不 忍 煩 惱"
            ),
            Verse(
                number: 167,
                text: "the afflictions of laxity due to being lazy and indulgent;",
                pinyin: "dài duò huǎn zòng bù qín fán nǎo",
                chinese: "怠 惰 緩 縱 ‧ 不 勤 煩 惱"
            ),
            Verse(
                number: 168,
                text: "the afflictions of gross and nuanced discrimination due to doubts and restlessness;",
                pinyin: "yí lǜ zào dòng jué guān fán nǎo",
                chinese: "疑 慮 躁 動 ‧ 覺 觀 煩 惱"
            ),
            Verse(
                number: 169,
                text: "the afflictions of not knowing and not understanding due to delusional interaction with one's environment;",
                pinyin: "chù jìng mí huò wú zhī jiě fán nǎo",
                chinese: "觸 境 迷 惑 ‧ 無 知 解 煩 惱"
            ),
            Verse(
                number: 170,
                text: "giving rise to the afflictions of self and other due to according with the Eight Worldly Winds.",
                pinyin: "suí shì bā fēng shēng bǐ wǒ fán nǎo",
                chinese: "隨 世 八 風 ‧ 生 彼 我 煩 惱"
            ),
            Verse(
                number: 171,
                text: "The afflictions of insincerity due to cajolery and flattery;",
                pinyin: "chǎn qū miàn yù bù zhí xīn fán nǎo",
                chinese: "諂 曲 面 譽 ‧ 不 直 心 煩 惱"
            ),
            Verse(
                number: 172,
                text: "the afflictions of discord due to being fiercely violent and unapproachable;",
                pinyin: "qiáng bù tiáo hé fán nǎo",
                chinese: "強 獷 難 觸 ‧ 不 調 和 煩 惱"
            ),
            Verse(
                number: 173,
                text: "the afflictions of harboring resentment due to irritability and fussiness;",
                pinyin: "duō hán hèn fán nǎo",
                chinese: "易 忿 難 悅 ‧ 多 含 恨 煩 惱"
            ),
            Verse(
                number: 174,
                text: "the afflictions of ruthlessness due to piercing envy;",
                pinyin: "jí dù jī cì hěn lì fán nǎo",
                chinese: "嫉 妬 擊 刺 ‧ 狠 戾 煩 惱"
            ),
            Verse(
                number: 175,
                text: "the afflictions of maliciousness due to being vicious and violent;",
                pinyin: "xiōng xiǎn bào hài cǎn dú fán nǎo",
                chinese: "凶 險 暴 害 ‧ 慘 毒 煩 惱"
            ),
            Verse(
                number: 176,
                text: "the afflictions of attaching to forms due to denying the Noble Truths.",
                pinyin: "guāi bèi shèng dì zhí xiàng fán nǎo",
                chinese: "乖 背 聖 諦 ‧ 執 相 煩 惱"
            ),
            Verse(
                number: 177,
                text: "Gave rise the afflictions of delusion through [misunderstanding] suffering, its origin, its cessation, and the path to its cessation;",
                pinyin: "yú kǔ jí miè dào shēng diān dǎo fán nǎo",
                chinese: "於 苦 集 滅 道 ‧ 生 顚 倒 煩 惱"
            ),
            Verse(
                number: 178,
                text: "the afflictions of cyclic existence due to following birth and death as well as the Twelve Links of Dependent Origination;",
                pinyin: "suí cóng shēng sǐ shí èr yīn yuán lún zhuǎn fán nǎo",
                chinese: "隨 從 生 死 ‧ 十 二 因 緣 ‧ 輪 轉 煩 惱"
            ),
            Verse(
                number: 179,
                text: "up to and including as many afflictions as the grains of sand in the Ganges River due to ignorance and the Foundations [of Afflictions] since beginningless time.",
                pinyin: "nǎi zhì wú shǐ wú míng zhù dì héng shā fán nǎo",
                chinese: "乃 至 無 始 無 明 住 地 ‧ 恆 沙 煩 惱"
            ),
            Verse(
                number: 180,
                text: "And giving rise to the afflictions of the suffering of the Three Realms through establishing the Four Foundations [of Afflictions].",
                pinyin: "qǐ sì zhù dì gòu yú sān jiè kǔ guǒ fán nǎo wú liàng wú biān",
                chinese: "起 四 住 地 ‧ 構 於 三 界 ‧ 苦 果 煩 惱 ‧ 無 量 無 邊"
            ),
            Verse(
                number: 181,
                text: "Today, we confess these to the Buddhas, honored Dharma, and sacred Sangha of the ten directions to repent and reform for them all.",
                pinyin: "nǎo luàn xián shèng liù dào sì shēng jīn rì fā lù xiàng shí fāng fó zūn fǎ shèng zhòng jiē xī chàn huǐ",
                chinese: "惱 亂 賢 聖 ‧ 六 道 四 生 。 今 日 發 露 ‧ 向 十 方 佛 、 尊 法 、 聖 眾 ‧ 皆 悉 懺 悔"
            ),
            Verse(
                number: 182,
                text: "Through the merits and virtues born from repenting and reforming all afflictions born of mental karma such as desire, aversion, and ignorance.",
                pinyin: "yuàn zhòng děng chéng shì chàn huǐ yì yè suǒ qǐ tān chēn chī děng yí qiè fán nǎo",
                chinese: "願 某 等 承 是 懺 悔 ‧ 意 業 所 起 ‧ 貪 瞋 癡 等 ‧ 一 切 煩 惱"
            ),
            Verse(
                number: 183,
                text: "We vow that for birth after birth, lifetime after lifetime, we will remove the banner of arrogance;",
                pinyin: "suǒ shēng gōng dé shēng shēng shì shì zhé jiāo màn chuáng",
                chinese: "所 生 功 德 ‧ 生 生 世 世 ‧ 折 憍 慢 幢"
            ),
            Verse(
                number: 184,
                text: "remove the roots of doubt;",
                pinyin: "jié ài yù shuǐ",
                chinese: "竭 愛 欲 水"
            ),
            Verse(
                number: 185,
                text: "cut through the net of wrong views;",
                pinyin: "miè chēn huì huǒ pò yú chī àn bá duàn yí gēn liè zhū jiàn wǎng",
                chinese: "滅 瞋 恚 火 ‧ 破 愚 癡 闇 ‧ 拔 斷 疑 根 ‧ 裂 諸 見 網"
            ),
            Verse(
                number: 186,
                text: "truly understand the Three Realms as a prison, the Four Elements as venomous snakes, the Five Aggregates as bandits, the Six Senses as a formation of emptiness, and passion as an imposter trying to seem friendly and virtuous.",
                pinyin: "shēn shí sān jiè yóu rú láo yù sì dà dú shé wǔ yīn yuàn zéi liù rù kōng jù ài zhà qīn shàn",
                chinese: "深 識 三 界 ‧ 猶 如 牢 獄 。 四 大 毒 蛇 ‧ 五 陰 怨 賊 ‧ 六 入 空 聚 ‧ 愛 詐 親 善"
            ),
            Verse(
                number: 187,
                text: "Dry the river of passion and desires;",
                pinyin: "xiū bā shèng dào duàn wú míng yuán",
                chinese: "修 八 聖 道 ‧ 斷 無 明 源"
            ),
            Verse(
                number: 188,
                text: "extinguish the flames of aversion and anger;",
                pinyin: "zhèng xiàng niè pán bù xiū bù xī",
                chinese: "正 向 涅 槃 ‧ 不 休 不 息"
            ),
            Verse(
                number: 189,
                text: "dispel the darkness of ignorance and delusion;",
                pinyin: "sān shí qī pǐn xīn xīn xiāng xù",
                chinese: "三 十 七 品 ‧ 心 心 相 續"
            ),
            Verse(
                number: 190,
                text: "practice the Noble Eightfold Path and sever the source of ignorance; progress towards nirvana without resting or ceasing; maintain the Thirty-Seven Factors of Awakening in every thought; and always be able to manifest the Ten Pāramitās.",
                pinyin: "shí bō luó mì cháng dé xiàn qián",
                chinese: "十 波 羅 蜜 ‧ 常 得 現 前"
            ),
            Verse(
                number: 191,
                text: "Having repented and reformed, sincerely and faithfully venerate the eternally abiding Triple Gem!",
                pinyin: "chàn huǐ fā yuàn yǐ zhì xīn xìn lǐ cháng zhù sān bǎo",
                chinese: "懺 悔 發 願 已 ‧ 至 心 信 禮 常 住 三 寶"
            )
        ]
        for verse in waterChapter5.verses {
            verse.chapter = waterChapter5
        }
        
        // MARK: Water Repentance - Chapter 6: Closing and Dedication
        let waterChapter6 = Chapter(number: 6, title: "Closing and Dedication")
        waterChapter6.text = waterRepentance
        waterChapter6.verses = [
            Verse(
                number: 1,
                text: "How many past transgressions were there for the ulcer to resemble a human face?",
                pinyin: "chuāng rú rén miàn sù hàn hé duō",
                chinese: "瘡 如 人 面 ‧ 宿 憾 何 多"
            ),
            Verse(
                number: 2,
                text: "With one handful of [water from] the pure spring, it disappeared entirely.",
                pinyin: "qīng quán yì jū jí xiāo mó",
                chinese: "清 泉 一 掬 卽 消 磨"
            ),
            Verse(
                number: 3,
                text: "Giving rise to empathy for himself and then for others, [Master Wuda] expounded on this as a method of repentance;",
                pinyin: "mǐn jǐ fù lián tuó shù wèi chàn mó",
                chinese: "愍 己 復 憐 佗 。 述 為 懺 摩"
            ),
            Verse(
                number: 4,
                text: "its waves of benevolence cleanse perpetually!",
                pinyin: "wàn gǔ mù ēn bō",
                chinese: "萬 古 沐 恩 波"
            ),
            Verse(
                number: 5,
                text: "Homage to the Equal Awakening Stage Bodhisattva-Mahāsattvas!",
                pinyin: "▲ ná mó děng jué dì pú sà mó hē sà (3x)",
                chinese: "南 無 等 覺 地 菩 薩 摩 訶 薩"
            ),
            Verse(
                number: 6,
                text: "Prayer of Exiting Repentance, Scroll One",
                pinyin: "● chū chàn wén",
                chinese: "出 懺 文"
            ),
            Verse(
                number: 7,
                text: "Respectfully listen! [The Buddha's] wondrous, purple-gold appearance accords with conditions to descend amidst a shower of blossoms in the forest.",
                pinyin: "gōng wén zǐ jīn miào xiāng suí yuán fù gǎn yú huá yǔ cóng zhōng",
                chinese: "恭 聞 ‧ 紫 金 妙 相 ‧ 隨 緣 赴 感 於 華 雨 叢 中"
            ),
            Verse(
                number: 8,
                text: "Your kind countenance, which resembles the full moon, empathizes with beings and shines radiantly from within the clouds of incense smoke.",
                pinyin: "mǎn yuè cí róng mǐn wù chuí guāng yú xiāng yān yún lǐ",
                chinese: "滿 月 慈 容 ‧ 愍 物 垂 光 於 香 烟 雲 裡"
            ),
            Verse(
                number: 9,
                text: "Seated upon the lion throne, you expound with a subtle and wondrous voice.",
                pinyin: "zuò shī zi zuò yǎn wēi miào yīn",
                chinese: "坐 獅 子 座 ‧ 演 微 妙 音"
            ),
            Verse(
                number: 10,
                text: "May you radiate with the brilliance of a thousand suns and witness us in our momentary dedication of merits.",
                pinyin: "yuàn shū qiān rì zhī guāng míng jiàn wǒ yī shí zhī huí xiàng",
                chinese: "願 舒 千 日 之 光 明 ‧ 鑑 我 一 時 之 回 向"
            ),
            Verse(
                number: 11,
                text: "On behalf of this assembly of your disciples, we have gathered the present pure assembly to practice the efficacious text of samādhi.",
                pinyin: "shàng lái fèng wèi qiú chàn mǒu děng pǔ jí xiàn xiàn qīng zhòng xūn xiū sān mèi ling wén",
                chinese: "上 來 奉 為 求 懺 某 等 ‧ 普 集 現 前 清 眾 ‧ 熏 修 三 昧 靈 文"
            ),
            Verse(
                number: 12,
                text: "We have now completed the merits and fruitions of the first scroll.",
                pinyin: "jīn dāng dì yī juàn gōng guǒ kè xié",
                chinese: "今 當 第 一 卷 ‧ 功 果 克 諧"
            ),
            Verse(
                number: 13,
                text: "Within the sanctuary, we and our fellow practitioners have burned incense, scattered flowers, kneeled, and joined our palms",
                pinyin: "wǒ zhū xíng rén yú qí tán nèi shāo xiāng sàn huā hú guì hé zhǎng",
                chinese: "我 諸 行 人 ‧ 於 其 壇 內 ‧ 燒 香 散 花 ‧ 胡 跪 合 掌"
            ),
            Verse(
                number: 14,
                text: "to repent for past transgressions through relying on the text, walked and circumambulated, as well as invoked and sung the [Buddha's] profound names.",
                pinyin: "yī wén chàn guò xíng dào rào xuán chēng chàng hóng míng",
                chinese: "依 文 懺 過 ‧ 行 道 遶 旋 ‧ 稱 唱 洪 名"
            ),
            Verse(
                number: 15,
                text: "May all of the merits and virtues accumulated [through these practices] be first extended in dedication to the eternally abiding Triple Gem of True Compassion;",
                pinyin: "suǒ jí gōng dé xiān shēn huí xiàng cháng zhù zhēn cí sān bǎo",
                chinese: "所 集 功 德 ‧ 先 伸 回 向 常 住 真 慈 ‧ 三 寶"
            ),
            Verse(
                number: 16,
                text: "to the Dharma protectors and various devas beneath the assembly;",
                pinyin: "huì xià hù fǎ zhū tiān",
                chinese: "會 下 ‧ 護 法 諸 天"
            ),
            Verse(
                number: 17,
                text: "to the spirits of the higher, middle, and lower realms;",
                pinyin: "shàng zhōng xià jiè zhī shén qí",
                chinese: "上 中 下 界 之 神 祇"
            ),
            Verse(
                number: 18,
                text: "as well as to the limitless spirits both near and far.",
                pinyin: "yuǎn jìn wú biān zhī líng kuàng",
                chinese: "遠 近 無 邊 之 靈 貺"
            ),
            Verse(
                number: 19,
                text: "We also humbly vow that through these merits and virtues, all will give rise to a mind of joy,",
                pinyin: "fú yuàn rú zī gōng dé xián shēng huān xǐ zhī xīn",
                chinese: "伏 願 ‧ 如 茲 功 德 ‧ 咸 生 歡 喜 之 心"
            ),
            Verse(
                number: 20,
                text: "blessings will flow and irrigate the human realm and the heavens above,",
                pinyin: "liú fú zé yú rén jiān tiān shàng",
                chinese: "流 福 澤 於 人 間 天 上"
            ),
            Verse(
                number: 21,
                text: "transform those in this and other realms.",
                pinyin: "xuān huà rì yú cǐ jiè tā fāng",
                chinese: "宣 化 日 於 此 界 他 方"
            ),
            Verse(
                number: 22,
                text: "The virtuous results from perfecting the Sanctuary of Awakening are dedicated on behalf of this assembly, your disciples who are seeking repentance,",
                pinyin: "yuán mǎn dào chǎng chū shēng shàn guǒ zhuān wèi qiú chàn mǒu děng",
                chinese: "圓 滿 道 場 ‧ 出 生 善 果 ‧ 專 為 求 懺 某 等"
            ),
            Verse(
                number: 23,
                text: "may all transgressions be absolved and all offenses be resolved.",
                pinyin: "miè zuì shì qiān yíng xiáng jí fú",
                chinese: "滅 罪 釋 愆 ‧ 迎 祥 集 福"
            ),
            Verse(
                number: 24,
                text: "May all seek rebirth in the Pure Land.",
                pinyin: "qiú shēng jìng tǔ",
                chinese: "求 生 淨 土"
            ),
            Verse(
                number: 25,
                text: "Furthermore, we humbly wish that all karmic transgressions in this life melt like ice,",
                pinyin: "fú jì yì shēng zuì yè bīng xiāo",
                chinese: "伏 冀 ‧ 一 生 罪 業 冰 消"
            ),
            Verse(
                number: 26,
                text: "that all karmic conditions be purified,",
                pinyin: "yí qiè yè yuán qīng jìng",
                chinese: "一 切 業 緣 清 淨"
            ),
            Verse(
                number: 27,
                text: "that we all are single-mindedly awakened and turn towards the truth of One Reality,",
                pinyin: "yì xīn jiě wù xiàng yī lǐ zhī zhēn rú",
                chinese: "一 心 解 悟 ‧ 向 一 理 之 眞 如"
            ),
            Verse(
                number: 28,
                text: "that we all have a single thought of returning to the light and create the wondrous path of the One Vehicle.",
                pinyin: "yí niàn huí guāng zào yí chèng zhī miào dào",
                chinese: "一 念 回 光 ‧ 造 一 乘 之 妙 道"
            ),
            Verse(
                number: 29,
                text: "May all conditions of suffering become instruments of bliss,",
                pinyin: "zhuǎn kǔ yuán ér chéng lè jù",
                chinese: "轉 苦 緣 而 成 樂 具"
            ),
            Verse(
                number: 30,
                text: "and may karmic afflictions be showered upon so that all obtain refreshing coolness.",
                pinyin: "sǎ yè nǎo ér dé qīng liáng",
                chinese: "灑 業 惱 而 得 清 涼"
            ),
            Verse(
                number: 31,
                text: "May our ancestors and those who have passed away affirm their rebirth in the Pure Land;",
                pinyin: "zǔ mí xiān wang jué ding wǎng shēng yú jìng jiè",
                chinese: "祖 禰 先 亡 ‧ 決 定 往 生 於 淨 界"
            ),
            Verse(
                number: 32,
                text: "may our surviving relatives continually enjoy the extents of their natural lifespan.",
                pinyin: "hé mén rén juàn fāng dāng yǒng xiǎng yú xiá líng",
                chinese: "合 門 人 眷 ‧ 方 當 永 享 於 遐 齡"
            ),
            Verse(
                number: 33,
                text: "May both our friends and foes bathe in the waves of benevolence together;",
                pinyin: "děng yuān qīn ér gong shè ēn bō",
                chinese: "等 冤 親 而 共 涉 恩 波"
            ),
            Verse(
                number: 34,
                text: "and may both ordinary and sacred beings ascend to the jeweled ground in unison.",
                pinyin: "yǔ fán shèng ér qí dēng bǎo dì",
                chinese: "與 凡 聖 而 齊 登 寶 地"
            ),
            Verse(
                number: 35,
                text: "Now, we have relied upon the text in repentance and reform.",
                pinyin: "jīn zé yī wén chàn huǐ",
                chinese: "今 則 依 文 懺 悔"
            ),
            Verse(
                number: 36,
                text: "Still fearing that the finer [transgressions] are difficult to eradicate, we again implore the honored assembly to seek repentance and reform together!",
                pinyin: "yòu kǒng wéi xì nán chú zài láo zūn zhòng tóng qiú chàn huǐ",
                chinese: "又 恐 微 細 難 除 ‧ 再 勞 尊 眾 ‧ 同 求 懺 悔"
            ),
            Verse(
                number: 37,
                text: "Homage to Samantabhadra Bodhisattva-Mahāsattva!",
                pinyin: "▲ ná mó pǔ xián wáng pú sà mó hē sà (3x)",
                chinese: "南 無 普 賢 王 菩 薩 摩 訶 薩"
            ),
            Verse(
                number: 38,
                text: "[Seven Buddhas Offense-Extinguishing Mantra]",
                pinyin: "qī fó miè zuì zhēn yán",
                chinese: "七 佛 滅 罪 真 言"
            ),
            Verse(
                number: 39,
                text: "ripa ripate kuha kuhate tranite nigalate vimarite mahāgate jāmlamcamte svāhā!",
                pinyin: "● li po li po di qiu he qiu he di tuo luo ni di ni he luo di pi li ni di mo he qie di zhen ling qian di sa po he (3x)",
                chinese: "離 婆 離 婆 帝 ‧ 求 訶 求 訶 帝 ‧ 陀 羅 尼 帝 ‧ 尼 訶 囉 帝 ‧ 毗 黎 你 帝 ‧ 摩 訶 伽 帝 ‧ 真 陵 乾 帝 ‧ 莎 婆 訶"
            )
        ]
        for verse in waterChapter6.verses {
            verse.chapter = waterChapter6
        }
        
        // MARK: Water Repentance - Chapter 7: Noon Offering Before the Buddhas
        let waterChapter7 = Chapter(number: 7, title: "Noon Offering Before the Buddhas")
        waterChapter7.text = waterRepentance
        waterChapter7.verses = [
            Verse(
                number: 0,
                text: "【佛前上供】",
                pinyin: "fó qián shàng gòng",
                chinese: "【佛 前 上 供】"
            ),
            Verse(
                number: 1,
                text: "NOON OFFERING BEFORE THE BUDDHAS",
                pinyin: "",
                chinese: ""
            ),
            Verse(
                number: 2,
                text: "[Triple Invocation 三稱]",
                pinyin: "sān chēng",
                chinese: "三 稱"
            ),
            Verse(
                number: 3,
                text: "Homage to the Vulture Peak Assembly of Buddhas and Bodhisattvas!",
                pinyin: "▲ ná mó líng shān huì shàng fó pú sà– (3x)",
                chinese: "南 無 靈 山 會 上 佛 菩 薩"
            ),
            Verse(
                number: 4,
                text: "[Repeat the following section three times.]",
                pinyin: "",
                chinese: ""
            ),
            Verse(
                number: 5,
                text: "[Offering Text 上供文]",
                pinyin: "shàng gòng wén",
                chinese: "上 供 文"
            ),
            Verse(
                number: 6,
                text: "Homage to the eternally abiding Buddhas of the Ten Directions.",
                pinyin: "▲ ná mó cháng zhù shí fāng fó",
                chinese: "南 無 常 住 十 方 佛"
            ),
            Verse(
                number: 7,
                text: "Homage to the eternally abiding Dharma of the Ten Directions.",
                pinyin: "ná mó cháng zhù shí fāng fǎ",
                chinese: "南 無 常 住 十 方 法"
            ),
            Verse(
                number: 8,
                text: "Homage to the eternally abiding Sangha of the Ten Directions.",
                pinyin: "ná mó cháng zhù shí fāng sēng",
                chinese: "南 無 常 住 十 方 僧"
            ),
            Verse(
                number: 9,
                text: "Homage to Our Teacher, Śākyamuni Buddha.",
                pinyin: "ná mó běn shī shì jiā móu ní fó",
                chinese: "南 無 本 師 釋 迦 牟 尼 佛"
            ),
            Verse(
                number: 10,
                text: "Homage to disaster-eradicating and longevity-extending Medicine Master Buddha.",
                pinyin: "ná mó xiāo zāi yán shòu yào shī fó",
                chinese: "南 無 消 災 延 壽 藥 師 佛"
            ),
            Verse(
                number: 11,
                text: "Homage to Western Pure Land, Amitābha Buddha.",
                pinyin: "ná mó jí lè shì jiè ō mí tuó fó",
                chinese: "南 無 極 樂 世 界 阿 彌 陀 佛"
            ),
            Verse(
                number: 12,
                text: "Homage to future descending-birth, honored Maitreya Buddha.",
                pinyin: "ná mó dāng lái xià shēng mí lè zūn fó",
                chinese: "南 無 當 來 下 生 彌 勒 尊 佛"
            ),
            Verse(
                number: 13,
                text: "Homage to all buddhas in the ten directions and three periods of time.",
                pinyin: "ná mó shí fāng sān shì yí qiè zhū fó",
                chinese: "南 無 十 方 三 世 一 切 諸 佛"
            ),
            Verse(
                number: 14,
                text: "Homage to Great Wisdom, Mañjuśrī Bodhisattva.",
                pinyin: "ná mó dà zhì wén shū shī lì pú sà",
                chinese: "南 無 大 智 文 殊 師 利 菩 薩"
            ),
            Verse(
                number: 15,
                text: "Homage to Great Practice, Samantabhadra Bodhisattva.",
                pinyin: "ná mó dà hèn pǔ xián pú sà",
                chinese: "南 無 大 行 普 賢 菩 薩"
            ),
            Verse(
                number: 16,
                text: "Homage to Great Compassion, Avalokiteśvara Bodhisattva.",
                pinyin: "ná mó dà bēi guān shì yīn pú sà",
                chinese: "南 無 大 悲 觀 世 音 菩 薩"
            ),
            Verse(
                number: 17,
                text: "Homage to Mahāsthāmaprāpta Bodhisattva.",
                pinyin: "ná mó dà shì zhì pú sà",
                chinese: "南 無 大 勢 至 菩 薩"
            ),
            Verse(
                number: 18,
                text: "Homage to the Great Oceanic Assembly of Pure Bodhisattvas.",
                pinyin: "ná mó qīng jìng dà hǎi zhòng pú sà",
                chinese: "南 無 清 淨 大 海 眾 菩 薩"
            ),
            Verse(
                number: 19,
                text: "Homage to Great Vows, Kṣitigarbha Bodhisattva.",
                pinyin: "ná mó dà yuàn dì zàng wáng pú sà",
                chinese: "南 無 大 願 地 藏 王 菩 薩"
            ),
            Verse(
                number: 20,
                text: "Homage to the myriad Dharma-Protecting Celestial Bodhisattvas.",
                pinyin: "ná mó hù fǎ zhū tiān pú sà",
                chinese: "南 無 護 法 諸 天 菩 薩"
            ),
            Verse(
                number: 21,
                text: "Homage to the sacred assembly of Sanghārāma Bodhisattvas.",
                pinyin: "ná mó qié lán shèng zhòng pú sà",
                chinese: "南 無 伽 藍 聖 眾 菩 薩"
            ),
            Verse(
                number: 22,
                text: "Homage to the successive generations of Ancestral Master Bodhisattvas. [Return to ▲ and repeat the section three times.]",
                pinyin: "ná mó lì dài zǔ shī pú sà",
                chinese: "南 無 歷 代 祖 師 菩 薩"
            ),
            Verse(
                number: 23,
                text: "[Transformation of Food Dhāraṇī 變食真言]",
                pinyin: "biàn shí zhēn yán",
                chinese: "變 食 真 言"
            ),
            Verse(
                number: 24,
                text: "Namaḥ sarva-tathāgatāvalokite oṃ sambhara sambhara hūṃ!",
                pinyin: "▲ na mo sa wa da ta ye duo– wa lu zhi di– om– san– bo la– san– bo la– hong– (3x)",
                chinese: "曩 謨 薩 嚩 怛 他 誐 多 ‧ 嚩 嚧 枳 帝 ‧ 唵 ‧ 三 跋 囉 ‧ 三 跋 囉 ‧ 吽 。"
            ),
            Verse(
                number: 25,
                text: "[Sweet Dew Dhāraṇī 甘露水真言]",
                pinyin: "gān lù shuǐ zhēn yán",
                chinese: "甘 露 水 真 言"
            ),
            Verse(
                number: 26,
                text: "Namaḥ surūpāya tathāgatāya tadyathā oṃ suru suru pra suru pra suru svāhā!",
                pinyin: "▲ na mo su lu po ye– da ta ye duo ye– da zhi ta– om– su lu– su lu– bo la su lu bo la su lu suo po he– (3x)",
                chinese: "曩 謨 蘇 嚕 婆 耶 ‧ 怛 他 誐 多 耶 ‧ 怛 姪 他 ‧ 唵 ‧ 蘇 嚕 ‧ 蘇 嚕 ‧ 鉢 囉 蘇 嚕 ‧ 鉢 囉 蘇 嚕 ‧ 娑 婆 訶 。"
            ),
            Verse(
                number: 27,
                text: "This food's form, fragrance, and flavor are offered above to the Buddhas of the ten directions, In the middle to all the sacred and virtuous ones, and below to the beings of the six realms. It is given without difference nor discrimination, fulfilling in accord to one's wishes; Causing all those who have contributed today to attain immeasurable perfections.",
                pinyin: "● cǐ shí sè xiāng wèi shàng gòng shí fāng fó zhōng fèng zhū shèng xián xià jí liù dào pǐn děng shī wú chā bié suí yuàn jiē bǎo mǎn lìng jīn shī zhě dé wú liàng bō luó mì",
                chinese: "此 食 色 香 味 ‧ 上 供 十 方 佛 ‧ 中 奉 諸 聖 賢 ‧ 下 及 六 道 品 。 等 施 無 差 別 ‧ 隨 願 皆 飽 滿 ‧ 令 今 施 者 得 ‧ 無 量 波 羅 蜜 。"
            ),
            Verse(
                number: 28,
                text: "The three virtues and six flavors are offered to the Buddha and Sangha. Sentient beings of the Dharma realm are universally and equally proffered this offering.",
                pinyin: "● sān dé liù wèi gòng fó jí sēng fǎ jiè yǒu qíng pǔ tóng gòng yǎng",
                chinese: "三 德 六 味 ‧ 供 佛 及 僧 ‧ 法 界 有 情 ‧ 普 同 供 養 。"
            ),
            Verse(
                number: 29,
                text: "[Universal Offering Dhāraṇī 普供養真言]",
                pinyin: "pǔ gòng yǎng zhēn yán",
                chinese: "普 供 養 真 言"
            ),
            Verse(
                number: 30,
                text: "Oṃ gagana sambhava vajra hoḥ!",
                pinyin: "▲ om– ye ye nang– san po wa– fa ri la– hu– (3x)",
                chinese: "唵 ‧ 誐 誐 曩 ‧ 三 婆 嚩 ‧ 伐 日 囉 ‧ 斛 。"
            ),
            Verse(
                number: 31,
                text: "Homage to the Eternally Abiding Triple Gem of the Mahāyāna!",
                pinyin: "▲ ná mó dà chèng cháng zhù sān bǎo (3x)",
                chinese: "南 無 大 乘 常 住 三 寶"
            ),
            Verse(
                number: 32,
                text: "[Declaration of Dedicative Report 宣讀文疏]",
                pinyin: "xuān dú wén shū",
                chinese: "宣 讀 文 疏"
            ),
            Verse(
                number: 33,
                text: "Homage to the Noble Adornment of the Buddha's Unsurpassed Bodhi!",
                pinyin: "▲ ná mó zhuāng yán wú shàng fó pú tí (3x)",
                chinese: "南 無 莊 嚴 無 上 佛 菩 提"
            ),
            Verse(
                number: 34,
                text: "[Celestial Kitchen Praise 天廚妙供讚]",
                pinyin: "tiān chú miào gòng zàn",
                chinese: "天 廚 妙 供 讚"
            ),
            Verse(
                number: 35,
                text: "This wondrous offering of the celestial kitchen is the butter of dhyāna-bliss. Oṃ suru- sarva tathāgata tadyathā suru svāhā!",
                pinyin: "● tiān chú miào gòng chán yuè sū tuó hu an su lu sa li wa da ta o ye duo da ni ye ta su lu suo wa he",
                chinese: "天 廚 妙 供 禪 悅 酥 酡 戶 唵 蘇 嚕 薩 哩 嚩 怛 他 阿 誐 多 怛 你 也 他 蘇 嚕 娑 嚩 訶"
            ),
            Verse(
                number: 36,
                text: "Homage to Dhyāna Bliss Treasury Bodhisattva-Mahāsattva! Mahāprajñāpāramitā!",
                pinyin: "▲ ná mó chán yuè zàng pú sà mó hē sà mó hē bō ruì bō luó mì",
                chinese: "南 無 禪 悅 藏 菩 薩 摩 訶 薩 摩 訶 般 若 波 羅 蜜"
            ),
            Verse(
                number: 37,
                text: "Homage to Amitābha Buddha.",
                pinyin: "▲ ná mó ō mí tuó fó",
                chinese: "南 無 阿 彌 陀 佛"
            )
        ]
        for verse in waterChapter7.verses {
            verse.chapter = waterChapter7
        }
        
        // MARK: Water Repentance - Chapter 8: Memorial Altar Dedication
        let waterChapter8 = Chapter(number: 8, title: "Memorial Altar Dedication")
        waterChapter8.text = waterRepentance
        waterChapter8.verses = [
            Verse(
                number: 0,
                text: "【往生壇回向】",
                pinyin: "wǎng shēng tán huí xiàng",
                chinese: "【往 生 壇 回 向】"
            ),
            Verse(
                number: 1,
                text: "MEMORIAL ALTAR DEDICATION",
                pinyin: "",
                chinese: ""
            ),
            Verse(
                number: 2,
                text: "[Triple Invocation and Prostration 三稱三拜]",
                pinyin: "sān chēng sān bài",
                chinese: "三 稱 三 拜"
            ),
            Verse(
                number: 3,
                text: "Homage to the Pure, Cool Ground Bodhisattva-Mahāsattvas!",
                pinyin: "▲ ná mó qīng liáng dì pú sà mó hē sà (3x)",
                chinese: "南 無 清 涼 地 菩 薩 摩 訶 薩"
            ),
            Verse(
                number: 4,
                text: "[Triple Invocation 三稱]",
                pinyin: "sān chēng",
                chinese: "三 稱"
            ),
            Verse(
                number: 5,
                text: "Homage to Guide and Receiver of the West, Amitābha Buddha!",
                pinyin: "▲ ná mó xī fāng jiē yǐn ō mí tuó fó (3x)",
                chinese: "南 無 西 方 接 引 阿 彌 陀 佛"
            ),
            Verse(
                number: 6,
                text: "[Heart Sūtra 般若心經]",
                pinyin: "bō ruì xīn jīng",
                chinese: "般 若 心 經"
            ),
            Verse(
                number: 7,
                text: "Prajñāpāramitā Heart Sūtra",
                pinyin: "● bō ruì bō luó mì duō xīn jīng",
                chinese: "般 若 波 羅 蜜 多 心 經"
            ),
            Verse(
                number: 8,
                text: "While practicing the profound prajñāpāramitā, Avalokiteśvara Bodhisattva clearly looked into the five aggregates, and overcame all ills and dissatisfaction by seeing them as all empty. Śāriputra! Form is no different from emptiness, emptiness is no different from form; form is just emptiness, emptiness is just form; so too are sensation, perception, volition, and consciousness.",
                pinyin: "guān zì zài pú sà xíng shēn bō ruì bō luó mì duō shí zhào jiàn wǔ yùn jiē kōng dù yí qiè kǔ è shè lì zǐ sè bú yì kōng kōng bú yì sè sè jí shì kōng kōng jí shì sè shòu xiǎng xíng shì yì fù rú shì",
                chinese: "觀 自 在 菩 薩 ‧ 行 深 般 若 波 羅 蜜 多 時 ‧ 照 見 五 蘊 皆 空 ‧ 度 一 切 苦 厄 。 舍 利 子 ‧ 色 不 異 空 ‧ 空 不 異 色 ‧ 色 即 是 空 ‧ 空 即 是 色 ‧ 受 想 行 識 亦 復 如 是 。"
            ),
            Verse(
                number: 9,
                text: "Śāriputra! This is the characteristic emptiness of all dharmas: they neither arise nor cease, are neither impure nor pure, neither increase nor decrease. Therefore, in emptiness, there is no form, no sensation, perception, volition nor consciousness; no eyes, ears, nose, tongue, body nor mind; no form, sound, scent, taste, touchable object nor mental formation; no realm of sight, up to no realm of mind; no ignorance and no end of ignorance, up to no aging and death and no end of aging and death; no dissatisfaction, origination, cessation or path; no wisdom and also no attainment.",
                pinyin: "shè lì zǐ shì zhū fǎ kōng xiàng bù shēng bú miè bú gòu bú jìng bù zēng bù jiǎn shì gù kōng zhōng wú sè wú shòu xiǎng xíng shì wú yǎn ér bí shé shēn yì wú sè shēng xiāng wèi chù fǎ wú yǎn jiè nǎi zhì wú yì shì jiè wú wú míng yì wú wú míng jìn nǎi zhì wú láo sǐ yì wú láo sǐ jìn wú kǔ jí miè dào wú zhì yì wú dé",
                chinese: "舍 利 子 ‧ 是 諸 法 空 相 ‧ 不 生 不 滅 ‧ 不 垢 不 淨 ‧ 不 增 不 減 。 是 故 空 中 無 色 ‧ 無 受 想 行 識 ‧ 無 眼 耳 鼻 舌 身 意 ‧ 無 色 聲 香 味 觸 法 ‧ 無 眼 界 ‧ 乃 至 無 意 識 界 ‧ 無 無 明 ‧ 亦 無 無 明 盡 ‧ 乃 至 無 老 死 ‧ 亦 無 老 死 盡 ‧ 無 苦 集 滅 道 ‧ 無 智 亦 無 得 。"
            ),
            Verse(
                number: 10,
                text: "By the absence of attainment, bodhisattvas, having relied on prajñāpāramitā, have no mental hindrances; because there are no hindrances, they have no fear and leave inverted dream-like delusions far behind, ultimately reaching nirvāṇa. All buddhas of all times, having relied on prajñāpāramitā, thus attain anuttarāsamyaksaṃbodhi. Therefore, know that prajñāpāramitā is the great spiritual mantra, the great illuminating mantra, the unexcelled mantra, the unequaled mantra; able to dispel all dissatisfaction, it is true, not deceptive. Thus the prajñāpāramitā mantra is proclaimed. Recite it this way: gate gate pāragate pārasaṃgate bodhi svāhā!",
                pinyin: "yǐ wú suǒ dé gù pú tí sà duǒ yī bō ruì bō luó mì duō gù xīn wú guà ài wú guà ài gù wú yǒu kǒng bù yuǎn lí diān dǎo mèng xiǎng jiù jìng niè pán sān shì zhū fó yī bō ruì bō luó mì duō gù dé ō niú duō luó sān miǎo sān pú tí gù zhī bō ruì bō luó mì duō shì dà shén zhòu shì dà míng zhòu shì wú shàng zhòu shì wú déng děng zhòu néng chú yí qiè kǔ zhēn shí bù xū gù shuō bō ruì bō luó mì duō zhòu jí shuō zhòu yuē jie di jie di bo luo jie di bo luo seng jie di pu ti sa po he",
                chinese: "以 無 所 得 故 ‧ 菩 提 薩 埵 ‧ 依 般 若 波 羅 蜜 多 故 ‧ 心 無 罣 礙 。 無 罣 礙 故 ‧ 無 有 恐 怖 ‧ 遠 離 顛 倒 夢 想 ‧ 究 竟 涅 槃 。 三 世 諸 佛 ‧ 依 般 若 波 羅 蜜 多 故 ‧ 得 阿 耨 多 羅 三 藐 三 菩 提 。 故 知 般 若 波 羅 蜜 多 ‧ 是 大 神 咒 ‧ 是 大 明 咒 ‧ 是 無 上 咒 ‧ 是 無 等 等 咒 ‧ 能 除 一 切 苦 ‧ 真 實 不 虛 。 故 說 般 若 波 羅 蜜 多 咒 ‧ 即 說 咒 曰 ‧ 揭 諦 揭 諦 ‧ 波 羅 揭 諦 ‧ 波 羅 僧 揭 諦 ‧ 菩 提 薩 婆 訶 。"
            ),
            Verse(
                number: 11,
                text: "[Rebirth in the Pure Land Dhāraṇī 往生咒]",
                pinyin: "wǎng shēng zhòu",
                chinese: "往 生 咒"
            ),
            Verse(
                number: 12,
                text: "Namo'mitābhāya tathāgatāya tadyathā [oṃ] amṛtod bhave amṛta-siddhaṃ bhave amṛta-vikrānte amṛta-vikrānta gāmini gagana kīrta kāre svāhā!",
                pinyin: "▲ na mo o mi duo po ye duo ta qie duo ye duo di ye ta o mi li dou po pi o mi li duo xi dan po pi o mi li duo pi jia lan di o mi li duo pi jia lan duo qie mi ni qie qie na zhi duo jia li suo po he (3x)",
                chinese: "南 無 阿 彌 多 婆 夜 ‧ 哆 他 伽 多 夜 ‧ 哆 地 夜 他 ‧ 阿 彌 利 都 婆 毗 ‧ 阿 彌 利 哆 ‧ 悉 耽 婆 毗 ‧ 阿 彌 唎 哆 ‧ 毗 迦 蘭 帝 ‧ 阿 彌 唎 哆 ‧ 毗 迦 蘭 多 ‧ 伽 彌 膩 ‧ 伽 伽 那 ‧ 枳 多 迦 利 ‧ 娑 婆 訶"
            ),
            Verse(
                number: 13,
                text: "[Transformation of Food Dhāraṇī 變食真言]",
                pinyin: "biàn shí zhēn yán",
                chinese: "變 食 真 言"
            ),
            Verse(
                number: 14,
                text: "Namaḥ sarva-tathāgatāvalokite oṃ sambhara sambhara hūṃ!",
                pinyin: "▲ na mo sa wa da ta ye duo– wa lu zhi di– om– san– bo la– san– bo la– hong– (3x)",
                chinese: "曩 謨 薩 嚩 怛 他 誐 多 ‧ 嚩 嚧 枳 帝 ‧ 唵 ‧ 三 跋 囉 ‧ 三 跋 囉 ‧ 吽 。"
            ),
            Verse(
                number: 15,
                text: "[Sweet Dew Dhāraṇī 甘露水真言]",
                pinyin: "gān lù shuǐ zhēn yán",
                chinese: "甘 露 水 真 言"
            ),
            Verse(
                number: 16,
                text: "Namaḥ surūpāya tathāgatāya tadyathā oṃ suru suru pra suru pra suru svāhā!",
                pinyin: "▲ na mo su lu po ye– da ta ye duo ye– da zhi ta– om– su lu– su lu– bo la su lu bo la su lu suo po he– (3x)",
                chinese: "曩 謨 蘇 嚕 婆 耶 ‧ 怛 他 誐 多 耶 ‧ 怛 姪 他 ‧ 唵 ‧ 蘇 嚕 ‧ 蘇 嚕 ‧ 鉢 囉 蘇 嚕 ‧ 鉢 囉 蘇 嚕 ‧ 娑 婆 訶 。"
            ),
            Verse(
                number: 17,
                text: "[Universal Offering Dhāraṇī 普供養真言]",
                pinyin: "pǔ gòng yǎng zhēn yán",
                chinese: "普 供 養 真 言"
            ),
            Verse(
                number: 18,
                text: "Oṃ gagana sambhava vajra hoḥ!",
                pinyin: "▲ om– ye ye nang– san po wa– fa ri la– hu– (3x)",
                chinese: "唵 ‧ 誐 誐 曩 ‧ 三 婆 嚩 ‧ 伐 日 囉 ‧ 斛 。"
            ),
            Verse(
                number: 19,
                text: "[Lotus Pool Praise 蓮池讚]",
                pinyin: "lián chí zàn",
                chinese: "蓮 池 讚"
            ),
            Verse(
                number: 20,
                text: "In the Lotus Pool Oceanic Assembly, Amitābha Tathāgata, Avalokiteśvara, and Mahāsthāmaprāpta sit upon lotus thrones, receiving and guiding one up golden steps. Their mighty vows magnificently realized, universally wish all to leave the dust of defilements!",
                pinyin: "● liá n chí hǎi huì mí tuó rú lái guān yīn shì zhì zuò lián tái jiē yǐn shàng jīn jiē dà shì hóng kāi pǔ yuàn lí chén āi",
                chinese: "蓮 池 海 會 ‧ 彌 陀 如 來 ‧ 觀 音 勢 至 坐 蓮 臺 ‧ 接 引 上 金 階 。 大 誓 弘 開 ‧ 普 願 離 塵 埃 。"
            ),
            Verse(
                number: 21,
                text: "Homage to the Lotus Pool Oceanic Assembly of Bodhisattva-Mahāsattvas!",
                pinyin: "▲ ná mó lián chí hǎi huì pú sà mó hē sà (3x)",
                chinese: "南 無 蓮 池 海 會 菩 薩 摩 訶 薩"
            ),
            Verse(
                number: 22,
                text: "Homage to Amitābha Buddha.",
                pinyin: "▲ ná mó ō mí tuó fó",
                chinese: "南 無 阿 彌 陀 佛"
            )
        ]
        for verse in waterChapter8.verses {
            verse.chapter = waterChapter8
        }
        
        // MARK: Water Repentance - Chapter 9: Dedication
        let waterChapter9 = Chapter(number: 9, title: "Dedication")
        waterChapter9.text = waterRepentance
        waterChapter9.verses = [
            Verse(
                number: 0,
                text: "【回向】",
                pinyin: "huí xiàng",
                chinese: "【回 向】"
            ),
            Verse(
                number: 1,
                text: "DEDICATION",
                pinyin: "",
                chinese: ""
            ),
            Verse(
                number: 2,
                text: "Homage to Amitābha Buddha.",
                pinyin: "▲ ná mó ō mí tuó fó",
                chinese: "南 無 阿 彌 陀 佛"
            ),
            Verse(
                number: 3,
                text: "[Three Refuges 三皈依文]",
                pinyin: "sān guī yī wén",
                chinese: "三 皈 依 文"
            ),
            Verse(
                number: 4,
                text: "I seek refuge in the Buddha, wishing that all sentient beings understand the great Path and make the greatest vow!",
                pinyin: "● zì guī yī fó dāng yuàn zhòng shēng tǐ jiě dà dào fā wú shàng xīn",
                chinese: "自 皈 依 佛 ‧ 當 願 眾 生 ‧ 體 解 大 道 ‧ 發 無 上 心 。"
            ),
            Verse(
                number: 5,
                text: "I seek refuge in the Dharma, wishing that all sentient beings deeply study the sūtra treasury and acquire an ocean of wisdom!",
                pinyin: "● zì guī yī fǎ dāng yuàn zhòng shēng shēn rù jīng zàng zhì huì rú hǎi",
                chinese: "自 皈 依 法 ‧ 當 願 眾 生 ‧ 深 入 經 藏 ‧ 智 慧 如 海 。"
            ),
            Verse(
                number: 6,
                text: "I seek refuge in the Sangha, wishing that all sentient beings lead the congregation without any obstruction!",
                pinyin: "● zì guī yī sēng dāng yuàn zhòng shēng tóng lǐ dà zhòng yí qiè wú ài",
                chinese: "自 皈 依 僧 ‧ 當 願 眾 生 ‧ 統 理 大 眾 ‧ 一 切 無 礙 。"
            ),
            Verse(
                number: 7,
                text: "[Dedication Verse 回向偈]",
                pinyin: "huí xiàng jì",
                chinese: "回 向 偈"
            ),
            Verse(
                number: 8,
                text: "May kindness, compassion, joy, and equanimity fill all Dharma Realms; May we cherish our blessings and create affinities benefitting heaven and earth; May we practice Chan, Pure Land, precepts, and the patience of equality; May we be humble, grateful, and bear a mind of great vows!",
                pinyin: "● cí bēi xí shě piàn fǎ jiè xí fú jié yuán lì rén tiān chán jìng jiè hèng píng děng rěn cán kuì gǎn ēn dà yuàn xīn",
                chinese: "慈 悲 喜 捨 遍 法 界 ‧ 惜 福 結 緣 利 人 天 ‧ 禪 淨 戒 行 平 等 忍 ‧ 慚 愧 感 恩 大 願 心 。"
            ),
            Verse(
                number: 9,
                text: "[Venerate the Buddha with Three Prostrations + Bow 禮佛三拜問訊]",
                pinyin: "lǐ fó sān bài wèn xùn",
                chinese: "禮 佛 三 拜 問 訊"
            ),
            Verse(
                number: 10,
                text: "[Dharma Talk by Officiant 主法開示]",
                pinyin: "zhǔ fǎ kāi shì",
                chinese: "主 法 開 示"
            ),
            Verse(
                number: 11,
                text: "Liturgy of the Samadhi Water Repentance of Kindness and Compassion: Scroll One | The End",
                pinyin: "cí bēi sān mèi shuǐ chàn kē yí juàn shàng zhōng",
                chinese: "慈 悲 三 昧 水 懺 科 儀 ‧ 卷 上 終"
            )
        ]
        for verse in waterChapter9.verses {
            verse.chapter = waterChapter9
        }
        
        waterRepentance.chapters.append(contentsOf: [waterChapter1, waterChapter2, waterChapter3, waterChapter4, waterChapter5, waterChapter6, waterChapter7, waterChapter8, waterChapter9])
        context.insert(waterRepentance)
        }
        
        try? context.save()
    }
}


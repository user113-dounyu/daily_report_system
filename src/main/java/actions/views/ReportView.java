package actions.views;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 日報情報について画面の入力値・出力値を扱うViewモデル
 *
 */
@Getter //全てのクラスフィールドについてgetterを自動生成する(Lombok)
@Setter //全てのクラスフィールドについてsetterを自動生成する(Lombok)
@NoArgsConstructor //引数なしコンストラクタを自動生成する(Lombok)
@AllArgsConstructor //全てのクラスフィールドを引数にもつ引数ありコンストラクタを自動生成する(Lombok)
public class ReportView {

    /**
     * id
     */
    private Integer id;

    /**
     * 日報を登録した従業員
     */
    private EmployeeView employee;

    /**
     * いつの日報かを示す日付
     */
    private LocalDate reportDate;

    /**
     * 日報のタイトル
     */
    private String title;

    /**
     * 日報の内容
     */
    private String content;

    /**
     * 日報の内容2
     */
    private String content2;

    /**
     * 日報の明日の目標
     */
    private String tomorrowGoal;

    /**
     * 日報のOEの内容1
     */
    private String contentOe1;

    /**
     * 日報のOEの内容2
     */
    private String contentOe2;

    /**
     * OEのタグ1
     */
    private Integer oeFlag1;

    /**
     * OEのタグ2
     */
    private Integer oeFlag2;

    /**
     * 登録日時
     */
    private LocalDateTime createdAt;

    /**
     * 更新日時
     */
    private LocalDateTime updatedAt;
}